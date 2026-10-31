#!/usr/bin/env bash
# beforeShellExecution. Always exit 0. JSON only on stdout.
set -euo pipefail

input=$(cat)

deny() {
  jq -nc --arg user "$1" --arg agent "$2" \
    '{permission:"deny",user_message:$user,agent_message:$agent}'
  exit 0
}

ask() {
  jq -nc --arg user "$1" --arg agent "$2" \
    '{permission:"ask",user_message:$user,agent_message:$agent}'
  exit 0
}

allow() {
  printf '%s\n' '{"permission":"allow"}'
  exit 0
}

if ! printf '%s' "$input" | jq -e . >/dev/null 2>&1; then
  deny "Hook received invalid JSON." "guard-shell denied the command because stdin was not valid JSON."
fi

cmd=$(printf '%s' "$input" | jq -r '.command // empty')

protected_path_word() {
  local p="$1"
  p="${p#\"}"
  p="${p%\"}"
  p="${p#\'}"
  p="${p%\'}"
  case "$p" in
    .cursor/hooks.json | */.cursor/hooks.json) return 0 ;;
    .cursor/check-cmd | */.cursor/check-cmd) return 0 ;;
    .cursor/hooks | .cursor/hooks/* | */.cursor/hooks | */.cursor/hooks/*) return 0 ;;
    .git/hooks | .git/hooks/* | */.git/hooks | */.git/hooks/*) return 0 ;;
  esac
  return 1
}

flatten_separators() {
  local c="$1"
  c="${c//&&/$'\n'}"
  c="${c//||/$'\n'}"
  c="${c//|/$'\n'}"
  c="${c//;/$'\n'}"
  printf '%s' "$c"
}

is_dangerous_rm() {
  local flat segment w seen_rm
  local -a words
  local recursive force target
  flat=$(flatten_separators "$1")
  while IFS= read -r segment || [[ -n "$segment" ]]; do
    [[ -z "${segment//[[:space:]]/}" ]] && continue
    read -ra words <<< "$segment"
    [[ ${#words[@]} -eq 0 ]] && continue
    recursive=0
    force=0
    target=0
    seen_rm=0
    for w in "${words[@]}"; do
      if [[ "$w" == "rm" ]]; then
        seen_rm=1
        continue
      fi
      [[ $seen_rm -eq 1 ]] || continue
      if [[ "$w" == "--" ]]; then
        continue
      fi
      if [[ "$w" == "--recursive" ]]; then
        recursive=1
        continue
      fi
      if [[ "$w" == "--force" ]]; then
        force=1
        continue
      fi
      if [[ "$w" =~ ^-[A-Za-z]+$ ]]; then
        [[ "$w" == *r* ]] && recursive=1
        [[ "$w" == *f* ]] && force=1
        continue
      fi
      if [[ "$w" == "/" || "$w" == "/*" || "$w" == "~" || "$w" == "~/" || "$w" == '$HOME' || "$w" == '$HOME/' || "$w" == '${HOME}' || "$w" == '${HOME}/' ]]; then
        target=1
      fi
    done
    if [[ $seen_rm -eq 1 && $recursive -eq 1 && $force -eq 1 && $target -eq 1 ]]; then
      return 0
    fi
  done <<< "$flat"
  return 1
}

is_command_word() {
  local name="$1"
  local flat="$2"
  local w
  local -a words
  flat="${flat//&&/ }"
  flat="${flat//||/ }"
  flat="${flat//|/ }"
  flat="${flat//;}"
  read -ra words <<< "$flat"
  for w in "${words[@]}"; do
    [[ "$w" == "$name" || "$w" == "$name".* ]] && return 0
  done
  return 1
}

is_dd_onto_disk() {
  local c="$1" of
  is_command_word dd "$c" || return 1
  [[ "$c" =~ of=([^[:space:]]+) ]] || return 1
  of="${BASH_REMATCH[1]}"
  of="${of#\"}"
  of="${of%\"}"
  of="${of#\'}"
  of="${of%\'}"
  case "$of" in
    /dev/sd* | /dev/nvme* | /dev/vd* | /dev/xvd* | /dev/hd* | /dev/mmcblk* | /dev/disk* | /dev/loop* | /dev/mapper/* | /dev/md*)
      return 0
      ;;
  esac
  return 1
}

is_force_push() {
  local flat segment w
  local -a words
  local has_git has_push has_force
  flat=$(flatten_separators "$1")
  while IFS= read -r segment || [[ -n "$segment" ]]; do
    [[ -z "${segment//[[:space:]]/}" ]] && continue
    read -ra words <<< "$segment"
    has_git=0
    has_push=0
    has_force=0
    for w in "${words[@]}"; do
      [[ "$w" == "git" ]] && has_git=1
      [[ "$w" == "push" ]] && has_push=1
      if [[ "$w" == "--force" || "$w" == --force=* || "$w" == "--force-with-lease" || "$w" == --force-with-lease=* ]]; then
        has_force=1
      fi
      if [[ "$w" =~ ^-[A-Za-z]*f[A-Za-z]*$ ]]; then
        has_force=1
      fi
    done
    if [[ $has_git -eq 1 && $has_push -eq 1 && $has_force -eq 1 ]]; then
      return 0
    fi
  done <<< "$flat"
  return 1
}

has_protected_redirect() {
  local c="$1"
  local i=${#c}
  local n=0
  local ch target
  while [[ $n -lt $i ]]; do
    ch=${c:n:1}
    if [[ $ch != ">" ]]; then
      n=$((n + 1))
      continue
    fi
    n=$((n + 1))
    if [[ $n -lt $i && ${c:n:1} == ">" ]]; then
      n=$((n + 1))
    fi
    if [[ $n -lt $i && ${c:n:1} == "|" ]]; then
      n=$((n + 1))
    fi
    while [[ $n -lt $i ]]; do
      ch=${c:n:1}
      [[ $ch == " " || $ch == $'\t' ]] || break
      n=$((n + 1))
    done
    target=""
    while [[ $n -lt $i ]]; do
      ch=${c:n:1}
      case $ch in
        " " | $'\t' | ";" | "&" | "|" | "<" | ">") break ;;
      esac
      target+="$ch"
      n=$((n + 1))
    done
    if [[ -n "$target" ]] && protected_path_word "$target"; then
      return 0
    fi
  done
  return 1
}

aimed_write() {
  local flat segment w
  local -a words
  local utility path
  flat=$(flatten_separators "$1")
  while IFS= read -r segment || [[ -n "$segment" ]]; do
    [[ -z "${segment//[[:space:]]/}" ]] && continue
    read -ra words <<< "$segment"
    utility=0
    path=0
    for w in "${words[@]}"; do
      case "$w" in
        rm | mv | cp | tee | sed | chmod) utility=1 ;;
      esac
      if protected_path_word "$w"; then
        path=1
      fi
    done
    if [[ $utility -eq 1 && $path -eq 1 ]]; then
      return 0
    fi
  done <<< "$flat"
  return 1
}

if is_dangerous_rm "$cmd"; then
  deny "This command can wipe the root or home directory." "guard-shell denied rm -rf aimed at /, ~, or \$HOME."
fi

if is_command_word mkfs "$cmd"; then
  deny "mkfs formats a disk." "guard-shell denied mkfs."
fi

if is_dd_onto_disk "$cmd"; then
  deny "dd would write onto a disk device." "guard-shell denied dd onto a disk."
fi

if is_force_push "$cmd"; then
  deny "Force-push is denied." "guard-shell denied git push with --force, -f, or --force-with-lease."
fi

if has_protected_redirect "$cmd" || aimed_write "$cmd"; then
  deny "This command writes a harness file." "guard-shell denied a write aimed at .cursor/hooks.json, .cursor/hooks/, .cursor/check-cmd, or .git/hooks."
fi

if [[ "$cmd" =~ curl|wget|(^|[^[:alnum:]_])nc([^[:alnum:]_]|$) ]] && [[ ! "$cmd" =~ localhost|127\.0\.0\.1 ]]; then
  ask "This command may make a network request. Please review it before continuing." "guard-shell asked because the command includes curl, wget, or nc and does not mention localhost or 127.0.0.1."
fi

allow
