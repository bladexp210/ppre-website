# Deploy

No Coolify config, Dockerfile, or compose file is in this repo. The only workflow is the secret scan. That workflow is not this deploy.

Coolify’s static build serves one base directory. That directory is the site assets and the answer files. It is not the repository root. The repository root contains the raw database, and a root deploy would copy it onto the VPS.

## Include

- The site assets: the HTML, CSS, and JavaScript.
- The answer files.

## Exclude

These stay in GitHub and in CI. The deploy does not copy them to the VPS.

- `data/ipip120.sqlite` — the raw database
- `data/ipip120.csv`
- `data/IPIP120.dat`
- `data/IPIP120.por.zip`
- `data/IPIP-NEO-ItemKey.xls`
- `data/IPIP-NEO-120 Scoring Tool.xls`

`data/` is not excluded as a whole. The citation and the scoring key live in that directory.

Do not gitignore these files. Gitignore would remove them from GitHub. The exclusion is the Coolify base directory, which does not contain them.

## Address

The VPS is on Hostinger. Its IPv4 address is `76.13.42.29`.

`sakina.app` was bought at Namecheap. Its name servers are `ns1.digitalocean.com`, `ns2.digitalocean.com`, and `ns3.digitalocean.com`.

Two A records still need to be added by hand in the DigitalOcean DNS panel. Both point at `76.13.42.29`.

| Name | Type | Points at |
| :--- | :--- | :--- |
| `insights` | A | `76.13.42.29` |
| `analytics` | A | `76.13.42.29` |

After those records exist, attach `insights.sakina.app` to the website and `analytics.sakina.app` to Umami in Coolify’s PPRE project.

These records were not created from this machine. Hostinger’s DNS does not hold `sakina.app`. No DigitalOcean login is available here.
