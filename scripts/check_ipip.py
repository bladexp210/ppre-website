"""Check the IPIP-NEO-120 data files. Read-only. Does not download.

Passes when the database has 619,150 rows, the scoring key has 120 items
and anxiety is I1, I31, I61, and I91, and the CSV matches the database
columns and row count. Does not read docs/nfr.md.
"""

import csv
import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DB = ROOT / "data" / "ipip120.sqlite"
KEY = ROOT / "data" / "ipip120-scoring-key.md"
CSV = ROOT / "data" / "ipip120.csv"
EXPECTED_ROWS = 619_150
ANXIETY = ["I1", "I31", "I61", "I91"]


def fail(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(1)


def scoring_key():
    items = []
    anxiety = []
    for line in KEY.read_text(encoding="utf-8").splitlines():
        if not line.startswith("| I"):
            continue
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if not cells or not cells[0].startswith("I") or not cells[0][1:].isdigit():
            continue
        items.append(cells[0])
        if len(cells) > 3 and cells[3] == "Anxiety":
            anxiety.append(cells[0])
    return items, anxiety


def main() -> None:
    conn = sqlite3.connect(f"file:{DB}?mode=ro", uri=True)
    columns = [row[1] for row in conn.execute("PRAGMA table_info(respondents)")]
    count = conn.execute("SELECT COUNT(*) FROM respondents").fetchone()[0]
    conn.close()
    if count != EXPECTED_ROWS:
        fail(f"database has {count} rows, expected {EXPECTED_ROWS}")
    if "neuroticism_anxiety_1" not in columns:
        fail("database is missing neuroticism_anxiety_1")

    items, anxiety = scoring_key()
    if items != [f"I{n}" for n in range(1, 121)]:
        fail(f"scoring key has {len(items)} items, expected I1 through I120")
    if anxiety != ANXIETY:
        fail(f"anxiety items are {anxiety}, expected {ANXIETY}")

    with CSV.open(encoding="utf-8", newline="") as handle:
        reader = csv.reader(handle)
        header = next(reader)
        csv_rows = sum(1 for _ in reader)
    if header != columns:
        fail("CSV columns do not match the database")
    if csv_rows != EXPECTED_ROWS:
        fail(f"CSV has {csv_rows} data rows, expected {EXPECTED_ROWS}")

    print(f"ok {EXPECTED_ROWS} rows, 120 items, anxiety {', '.join(ANXIETY)}")


if __name__ == "__main__":
    main()
