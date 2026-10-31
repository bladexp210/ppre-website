# PPRE

Population Personality & Resilience Engine. A static website that shows one precomputed comparison at a time, so a reader can see what a Big Five chart is actually measuring.

The public site is planned at `insights.sakina.app`. That name does not resolve yet. The site pages are not built yet. The project is in phase 3, Build. The blueprint is accepted. Build has not started.

## What this repo holds

Decisions live under `docs/`. `docs/index.md` is the map. It points at each decision. It does not copy them.

| Path | What it is |
| :--- | :--- |
| `STATE.md` | Where the work is now |
| `AGENTS.md` | How a chat moves the project |
| `docs/problem-tree.md` | Who is hurt, the outcome, and what version one leaves out |
| `docs/c4/` | The website picture, the blueprint, the answer file shape, and the deploy note |
| `docs/learn/` | Accepted rules: scoring, age bands, the glossary, French, and Arabic |
| `docs/nfr.md` | Requirements |
| `data/` | The Johnson IPIP-NEO-120 source files that fit in git, plus the scoring key and the citation |
| `scripts/` | Import, export, scoring-key, and data-check scripts |
| `inbox/` | Early specs and the HTML mockup. They are not the current decisions |

The stack is plain HTML, CSS, and a little JavaScript. Charts use Chart.js. Answers are precomputed JSON files. There is no backend.

## Data

`data/ipip120.sqlite` and `data/ipip120.csv` are not in git. They are large. `.gitignore` lists them. `data/IPIP120.dat` is in git. GitHub warns that it is about 90 MB.

To rebuild the local database from the fixed-width file:

```bash
python3 scripts/import_ipip120.py
python3 scripts/export_ipip120_csv.py
```

`scripts/check_ipip.py` checks that local database. It is not the project check.

The citation and the column guide are in `data/sources.md` and `data/DAT120.md`.

## Check

The project check fetches the live site:

```bash
bash -c 'set -o pipefail; curl -fsSL --max-time 20 https://insights.sakina.app | grep -Eiq "how do .+ compare|room of a hundred"'
```

That command is stored in `.cursor/check-cmd`. It fails today because `insights.sakina.app` has no DNS address. The records still to add are in `docs/c4/ppre-deploy.md`.

## Deploy

Coolify on a Hostinger VPS (`76.13.42.29`) will serve the site and Umami. Both names are under `sakina.app`: `insights` for the site, `analytics` for Umami. Those A records are not in DNS yet. See `docs/c4/ppre-deploy.md`.
