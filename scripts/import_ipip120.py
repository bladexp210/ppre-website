"""Parse data/IPIP120.dat into data/ipip120.sqlite.

Column positions follow data/DAT120.md. Item values are stored as they
are in the file. Reverse scoring is already in the file and is not applied
again.
"""

import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "data" / "IPIP120.dat"
DST = ROOT / "data" / "ipip120.sqlite"

NAMES = [
    "case_number",
    "sex",
    "age",
    "sec",
    "min",
    "hour",
    "day",
    "month",
    "year",
    "country",
    *[f"i{n}" for n in range(1, 121)],
]


def parse(line: str, lineno: int) -> list:
    if len(line) != 151:
        raise SystemExit(f"line {lineno} length {len(line)}, expected 151")
    values = [
        int(line[0:6]),
        int(line[6:7]),
        int(line[7:9]),
        int(line[9:11]),
        int(line[11:13]),
        int(line[13:15]),
        int(line[15:17]),
        int(line[17:19]),
        int(line[19:22]),
        line[22:31].rstrip(),
    ]
    items = [int(ch) for ch in line[31:151]]
    if len(items) != 120:
        raise SystemExit(f"line {lineno} item count {len(items)}")
    return values + items


def main() -> None:
    if DST.exists():
        DST.unlink()
    columns = ", ".join(
        f"{name} INTEGER NOT NULL" if name != "country" else "country TEXT NOT NULL"
        for name in NAMES
    )
    placeholders = ", ".join("?" for _ in NAMES)
    insert_sql = f"INSERT INTO respondents ({', '.join(NAMES)}) VALUES ({placeholders})"
    conn = sqlite3.connect(DST)
    conn.execute("PRAGMA journal_mode = OFF")
    conn.execute("PRAGMA synchronous = OFF")
    conn.execute(f"CREATE TABLE respondents ({columns})")
    batch = []
    with SRC.open("r", encoding="ascii", newline="") as handle:
        for lineno, raw in enumerate(handle, 1):
            batch.append(parse(raw.rstrip("\r\n"), lineno))
            if len(batch) >= 20000:
                conn.executemany(insert_sql, batch)
                batch.clear()
        if batch:
            conn.executemany(insert_sql, batch)
    conn.commit()
    count = conn.execute("SELECT COUNT(*) FROM respondents").fetchone()[0]
    conn.close()
    print(count)


if __name__ == "__main__":
    main()
