"""Build data/ipip120-scoring-key.md from Johnson's IPIP-NEO item key.

The workbook is IPIP-NEO-ItemKey.xls from https://osf.io/ycvdk/
(direct file https://osf.io/download/yk3fd/). Column Short# is I1–I120.
A sign that starts with - is reverse-keyed.

Requires xlrd for the old .xls format.
"""

import argparse
from pathlib import Path

import xlrd

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "ipip120-scoring-key.md"
TRAIT = {
    "N": "neuroticism",
    "E": "extraversion",
    "O": "openness",
    "A": "agreeableness",
    "C": "conscientiousness",
}


def rows_from_workbook(path: Path) -> list[tuple]:
    sheet = xlrd.open_workbook(path).sheet_by_index(0)
    rows = []
    for record in range(1, sheet.nrows):
        _full, short, sign, key, facet, item = (
            sheet.cell_value(record, col) for col in range(6)
        )
        if short == "":
            continue
        key = str(key)
        rows.append(
            (
                int(short),
                str(sign),
                key,
                str(facet),
                str(item).strip(),
                TRAIT[key[0]],
            )
        )
    rows.sort()
    if [number for number, *_rest in rows] != list(range(1, 121)):
        raise SystemExit(f"{path} did not contain Short# 1 through 120")
    return rows


def markdown(rows: list[tuple]) -> str:
    reverse = [number for number, sign, *_rest in rows if sign.startswith("-")]
    lines = [
        "# IPIP-NEO-120 scoring key",
        "",
        "Source: `IPIP-NEO-ItemKey.xls` on https://osf.io/ycvdk/, downloaded from https://osf.io/download/yk3fd/ on 31 Oct 2026.",
        "",
        "Column `Short#` in that workbook is the item number in `IPIP120.dat` (`I1` through `I120`). A sign that starts with `-` is reverse-keyed. A sign that starts with `+` is scored as answered.",
        "",
        "`IPIP120.dat` already stores the flipped values for reverse-keyed items. Do not flip them again.",
        "",
        f"Reverse-keyed items ({len(reverse)}): "
        + ", ".join(f"I{number}" for number in reverse)
        + ".",
        "",
        "| Item | Trait | Facet code | Facet | Keying | Item text |",
        "| :--- | :--- | :--- | :--- | :--- | :--- |",
    ]
    for number, sign, key, facet, item, trait in rows:
        keying = "reverse" if sign.startswith("-") else "forward"
        lines.append(
            f"| I{number} | {trait} | {key} | {facet} | {keying} | {item.replace('|', '\\|')} |"
        )
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("workbook", type=Path, help="Path to IPIP-NEO-ItemKey.xls")
    args = parser.parse_args()
    OUT.write_text(markdown(rows_from_workbook(args.workbook)))
    print(OUT)


if __name__ == "__main__":
    main()
