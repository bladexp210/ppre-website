"""Export data/ipip120.sqlite to data/ipip120.csv for Google Data Studio.

Writes one header row of the table's column names, then every row.
Does not change the database.
"""

import csv
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "data" / "ipip120.sqlite"
DST = ROOT / "data" / "ipip120.csv"


def main() -> None:
    conn = sqlite3.connect(f"file:{SRC}?mode=ro", uri=True)
    columns = [row[1] for row in conn.execute("PRAGMA table_info(respondents)")]
    query = "SELECT " + ", ".join(columns) + " FROM respondents"
    with DST.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(columns)
        for row in conn.execute(query):
            writer.writerow(row)
    conn.close()
    print(DST)


if __name__ == "__main__":
    main()
