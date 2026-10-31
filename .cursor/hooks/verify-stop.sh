#!/usr/bin/env bash
# stop hook. Always exit 0. Success, NONE, and aborted print {}.
# loop_count 0: one repair follow-up.
# loop_count 1: last repair; the next step is a lesson draft under docs/learn/.
# loop_count 2 or more: print {} so a third repair is not sent.
set -euo pipefail

input=$(cat)

empty() {
  printf '%s\n' '{}'
  exit 0
}

followup() {
  jq -nc --arg m "$1" '{followup_message:$m}'
  exit 0
}

if ! printf '%s' "$input" | jq -e . >/dev/null 2>&1; then
  empty
fi

status=$(printf '%s' "$input" | jq -r '.status // "completed"')
loop_count=$(printf '%s' "$input" | jq -r '.loop_count // 0')
if ! [[ "$loop_count" =~ ^[0-9]+$ ]]; then
  loop_count=0
fi
if [[ "$status" == "aborted" ]]; then
  empty
fi

hook_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
project_root=$(cd "$hook_dir/../.." && pwd)
check_file="$hook_dir/../check-cmd"

if [[ ! -f "$check_file" ]]; then
  empty
fi

commands=()
while IFS= read -r line || [[ -n "$line" ]]; do
  line="${line%$'\r'}"
  line="${line#"${line%%[![:space:]]*}"}"
  line="${line%"${line##*[![:space:]]}"}"
  [[ -z "$line" ]] && continue
  [[ "$line" == \#* ]] && continue
  commands+=("$line")
done < "$check_file"

if [[ ${#commands[@]} -eq 0 ]]; then
  empty
fi

if [[ ${#commands[@]} -eq 1 && "${commands[0]}" == "NONE" ]]; then
  empty
fi

if [[ ${#commands[@]} -gt 1 ]]; then
  followup ".cursor/check-cmd has more than one command line. Keep a single command. This hook will not guess a test runner or a stack. Fix the file. Do not delete, skip, or replace the check with true or NONE."
fi

check_cmd="${commands[0]}"
set +e
output=$(cd "$project_root" && timeout 110 bash -lc "$check_cmd" 2>&1)
code=$?
set -e

if [[ $code -eq 0 ]]; then
  empty
fi

if [[ ${#output} -gt 8000 ]]; then
  output="${output:0:8000}"
fi

if [[ "$loop_count" -ge 2 ]]; then
  empty
fi

if [[ "$loop_count" -eq 1 ]]; then
  followup "Check failed: \`$check_cmd\` exited ${code}.
This is the last repair. Do not start a third repair.
The next step is a lesson draft under docs/learn/.
Fix the cause in product code. Do not edit the framework to get a green check.
Do not delete, skip, or replace the check with true or NONE.
Output:
${output}"
fi

followup "Check failed: \`$check_cmd\` exited ${code}.
Fix the cause. Do not delete, skip, or replace the check with true or NONE.
Output:
${output}"
