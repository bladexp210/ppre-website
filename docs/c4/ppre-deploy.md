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

## The other name

`sakinati.app` is a different domain. Its name servers are Namecheap’s (`dns1.registrar-servers.com` and `dns2.registrar-servers.com`). These A records are already live and point at `76.13.42.29`: `@`, `www`, `insights`, and `analytics`.

`insights.sakinati.app` reaches the VPS and gets `404 page not found`. No comparison page is deployed. The certificate for `sakinati.app` is on the server at `/etc/letsencrypt/live/sakinati.app/fullchain.pem`. It expires on 30 January 2027. Certbot will not renew it by itself, because the command was manual DNS with no renewal hook.

## Server

SSH: `ssh -i ~/.ssh/id_ed25519 root@76.13.42.29`

On 1 November 2026, `dnf update -y` finished cleanly: 193 packages upgraded, 9 installed, the 6.19 kernel removed. The new kernel on disk is `7.2.13-200.fc44`. The running kernel was still `7.1.5-200.fc44`. The server was not rebooted. Certbot was installed after that update, by Mohamed, not in that update step.
