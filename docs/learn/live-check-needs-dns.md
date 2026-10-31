# The live check needs a real address

Repair attempt 2 on `ppre-website`. The check in `.cursor/check-cmd` fetches `https://insights.sakina.app` and looks for a comparison question or the words “room of a hundred.”

The command exits 1 with `curl: (6) Could not resolve host: insights.sakina.app`.

`sakina.app` is served by DigitalOcean’s name servers. The apex name, `insights.sakina.app`, and `analytics.sakina.app` have no A record. This machine has no DigitalOcean login and no SSH config, so the record cannot be created from the repair. The page is not deployed.

Do not replace the check with `true` or `NONE`. Do not edit the framework to get a green check. A local hosts-file entry is not the live site.

The check can pass only after `insights.sakina.app` points at the VPS and that address serves a page with a “how do … compare” question or the words “room of a hundred.”

Status:
