# Loop log

One start line and one end line per loop. Name the tree node that moved. For a discovery pass, name whether the move was breadth, depth, or priority.

```text
start: <node id> | <loop kind> | <trigger>
end: <node id> | <loop kind> | <end state>
```

start: root | depth | human agreed to one sharpening pass
end: root | depth | who is hurt filled; depth vague → framed; outcome, signal, and out of scope still open
start: root | rework | human replaced the framed sentence with their stated pain
end: root | rework | root sentence is the human's words; depth stays framed
start: root | cadence | human set cadence before any build
end: root | cadence | cadence unset → linear; framing stays open; no child opened
start: root | lesson | human asked to keep an imagery-and-text rule for both builds
end: root | lesson | draft recorded for IPIP-NEO-120 and Understanding Society; status line blank
start: root | lesson | human asked to keep a data-says-what-it-says rule for both builds
end: root | lesson | draft recorded for IPIP-NEO-120 and Understanding Society; status line blank
start: root | lesson | human asked to record derived shocks as filters for the Understanding Society build
end: root | lesson | draft recorded for Understanding Society only; status line blank
start: root | lesson | human asked to record the full five-wave arc as the default for the Understanding Society build
end: root | lesson | draft recorded for Understanding Society only; status line blank
start: root | lesson | human set IPIP age bands to six decades and kept country dropped
end: root | lesson | draft recorded for IPIP-NEO-120 only; 420 group summaries, 2,310 pairs; status line blank
start: root | lesson | human widened IPIP age bands to 10–13 through 65 and above
end: root | lesson | draft updated for IPIP-NEO-120 only; 8 bands; 560 group summaries, 4,200 pairs; status line blank
start: root | lesson | human locked the IPIP fill-in-the-blank question pattern
end: root | lesson | draft recorded for IPIP-NEO-120 only; same trait or facet for both groups; country stays dropped; status line blank
start: root | lesson | human kept the room-of-a-hundred picture on every IPIP answer
end: root | lesson | draft recorded for IPIP-NEO-120 only; overlap shown as a hundred people from each group; status line blank
start: root | lesson | human required a small-sample warning on IPIP comparisons
end: root | lesson | draft recorded for IPIP-NEO-120 only; comparison still shown; status line blank
start: root | lesson | human excluded missing age from IPIP age-band comparisons
end: root | lesson | draft recorded for IPIP-NEO-120 only; age 0 ignored for age bands; kept for slices that do not use age; status line blank
start: root | lesson | human set IPIP baselines to whole population and sex only
end: root | lesson | draft recorded for IPIP-NEO-120 only; whole population includes missing age; no age baseline; status line blank
start: root | lesson | human set the IPIP answer layout, languages, and screen sizes
end: root | lesson | drafts recorded for IPIP-NEO-120 only; verdict sentence, glossary d bands, English French Arabic, phone and computer; status lines blank
start: root | lesson | human set the IPIP small-sample warning wording and placement
end: root | lesson | draft updated for IPIP-NEO-120 only; warning inline with the answer sentence; status line blank
start: root | lesson | human set how IPIP scores treat item value 0
end: root | lesson | draft recorded for IPIP-NEO-120 only; 0 is skipped; average answered items only; status line blank
start: root | lesson | human required at least 2 answered items before an IPIP score is shown
end: root | lesson | draft recorded for IPIP-NEO-120 only; fewer than 2 is no answer; facets have 4 items, traits have 24; status line blank
start: root | depth | human filled out of scope on the root
end: root | depth | out of scope filled: version one does not cover the longitudinal data from Understanding Society; outcome and signal still open; depth stays framed
start: root | depth | human filled the outcome on the root
end: root | depth | outcome filled: read the data straight, reformulate it, and pass it on; out of scope unchanged; signal still open; depth stays framed
start: root | depth | human deferred the signal for version one
end: root | depth | signal deferred, not defined; outcome and out of scope unchanged; depth stays framed
start: root | lesson | human set the IPIP small-sample cutoff at 30 per group
end: root | lesson | ipip-small-sample-warning status decided; below 30 still shown with the written warning
start: root | lesson | human set four Cohen's d labels
end: root | lesson | ipip-answer-layout status decided; negligible under 0.2, small to 0.5, medium to 0.8, large at 0.8 and up
start: root | nfr revise | human confirmed the first performance rule
end: root | nfr revise | performance row: browser never downloads the 619,150-row file; one precomputed answer at a time; other NFR rows still blank
start: root | nfr revise | human added smartphones to the performance rule
end: root | nfr revise | performance row: same no-full-download and one-answer rules hold on phone browsers
start: root | nfr revise | human confirmed the five timing rules
end: root | nfr revise | performance row includes 2s first answer, 300ms switch, 100ms hover, no freeze on draw, no-answer in the same time
start: root | nfr revise | human named the language and framework
end: root | nfr revise | language, framework row: plain HTML, CSS, and a little JavaScript, served statically with no backend
start: root | nfr revise | human set hosting and transparency
end: root | nfr revise | hosting, transparency row: sqlite public in GitHub; Coolify on Mohamed's VPS; source links for audit
start: root | nfr revise | human required citation of original data
end: root | nfr revise | auditability row: citation required; IPIP citation written in data/sources.md
start: root | check | human named the check command
end: root | check | .cursor/check-cmd is python3 scripts/check_ipip.py
start: root | nfr revise | human confirmed the safety rule
end: root | nfr revise | safety row: a data point is a group tendency, not a judgment of one person
start: root | nfr revise | human confirmed the security rule
end: root | nfr revise | security row: HTTPS on the VPS is enough for version one; no rate limit and no accounts; revisit if server-side computation is added
start: root | nfr revise | human confirmed the privacy rule
end: root | nfr revise | privacy row: page views, popular comparisons, drop-off, referrer, and device type
start: root | nfr revise | human confirmed the reliability rule
end: root | nfr revise | reliability row: a clear error when the database is unreachable or a precomputed answer is missing
start: root | nfr revise | human set where precomputed answers are served
end: root | nfr revise | deployment row: answers deployed to the VPS and served from disk; raw dataset on the VPS is never served to visitors
start: root | nfr revise | human confirmed the safe failure rule
end: root | nfr revise | safe failure row: a failed chart or script leaves the rest of the page working and asks the visitor to refresh
start: root | nfr revise | human noted a consideration for product observability
end: root | nfr revise | observability value cell stays blank; note: notify Mohamed when a chart or script fails, not only the visitor
start: root | nfr revise | human confirmed the longevity rule
end: root | nfr revise | longevity row: the project should live for at least one to two years
start: root | nfr revise | human updated the longevity rule
end: root | nfr revise | longevity row: one to two years is the minimum; the project grows bit by bit
start: root | nfr revise | human confirmed the efficiency rule
end: root | nfr revise | efficiency row: the site must run on low-end hardware, phone or computer
start: root | nfr revise | human confirmed the modularity rule
end: root | nfr revise | modularity row: chart engine or glossary can be swapped without rewriting everything
start: root | nfr revise | human filled the product observability row
end: root | nfr revise | product observability: a failed chart or script is logged where Mohamed can see it, not only shown to the visitor
start: root | nfr revise | human added an extensibility row
end: root | nfr revise | extensibility: more datasets and dashboards can be added without rewriting the site; separate from modularity
start: root | nfr revise | human said product observability is already set
end: root | nfr revise | STATE and docs/observability.md set product observability to logs; workflow Langfuse stays unset; phase stays 1; next work stays the blueprint for ppre-website
start: ppre-website | container file | the link id had no file
end: ppre-website | container file | docs/c4/ppre-website.md records the phase 1 container; phase stays 1; next work stays the blueprint
start: ppre-website | lesson | human chose Chart.js as the chart engine
end: ppre-website | lesson | Chart.js recorded; Streamlit and Plotly rejected because the stack is static HTML, CSS, and JavaScript with no backend
start: ppre-website | lesson | human chose JSON for precomputed answers
end: ppre-website | lesson | each answer is a JSON file, deployed and served from disk, one at a time
start: ppre-website | blueprint | human approved starting phase 2
end: ppre-website | blueprint | docs/c4/ppre-website-blueprint.md written; phase 1 → 2; no application code
start: ppre-website | lesson | human asked how the page resizes
end: ppre-website | lesson | viewport, fluid layout, one CSS breakpoint at 720px; Chart.js follows its box
start: ppre-website | lesson | human asked for two CSS breakpoints
end: ppre-website | lesson | viewport and fluid layout kept; breakpoints at 640px and 1024px
start: ppre-website | lesson | human set the middle tier to tablets and flipped phones
end: ppre-website | lesson | breakpoints stay 640px and 1024px; middle tier is tablet and phone landscape
start: root | lesson | human said the small-sample cutoff is 30, not 100
end: root | lesson | decision file and STATE already said 30; glossary and age bands now say fewer than 30; no under-100 text remains
start: root | index | human approved a separate decision index
end: root | index | docs/index.md created; AGENTS.md load order names it; stale empty-link text removed
start: root | index | human approved removing duplicated decision text
end: root | index | copies removed from STATE, container, blueprint, nfr observability cell, answer layout, glossary, and age bands; each old spot says see docs/index.md; canonical files kept
start: ppre-website | blueprint | human accepted the blueprint
end: ppre-website | blueprint | stopped; acceptance undone; phase stays 2
start: ppre-website | blueprint | human accepted the blueprint
end: ppre-website | blueprint | accepted on 31 Oct 2026; phase 2 → 3; Build not started
start: ppre-website | context | human set the Umami event-name rule
end: ppre-website | context | one human-readable event per pair: facet_gender_band_gender_band; index row added
start: ppre-website | blueprint | human approved a draft of the answer-file schema
end: ppre-website | blueprint | docs/c4/ppre-answer-schema.md written as a draft; not accepted
start: ppre-website | lesson | human set the room bands and made age band optional
end: ppre-website | lesson | five equal room bands recorded and accepted; schema age band optional for the three baselines; index already pointed at the room lesson
start: ppre-website | blueprint | human accepted the answer-file schema
end: ppre-website | blueprint | docs/c4/ppre-answer-schema.md status set to accepted; index row updated
start: ppre-website | context | human set the deploy to exclude the raw database
end: ppre-website | context | no Coolify config existed; docs/c4/ppre-deploy.md written; secret scan left unchanged
start: ppre-website | lesson | human asked for the French visitor copy before the build
end: ppre-website | lesson | docs/learn/fr.md written; English lesson files kept; schema example verdict.fr filled; Arabic still unwritten
start: ppre-website | lesson | human asked for the Arabic visitor copy
end: ppre-website | lesson | docs/learn/ar.md written; English lesson files kept; schema example verdict.ar filled
start: root | priority | human set the scarce resource to time
end: root | priority | STATE.md and the problem tree now say time; the index does not name the scarce resource
start: ppre-website | context | human placed Umami in the Sakina Coolify project
end: ppre-website | context | dashboard is analytics.sakina.app; sakina.app is the domain; PPRE stays a separate Coolify project
start: ppre-website | context | human corrected the Coolify project for Umami
end: ppre-website | context | Umami is in the PPRE project with the website; dashboard stays analytics.sakina.app; sakina.app is the domain only
start: ppre-website | context | human set the public site address
end: ppre-website | context | public site is insights.sakina.app; Umami stays analytics.sakina.app; both are in the PPRE Coolify project
start: ppre-website | context | human approved saving the context picture
end: ppre-website | context | docs/c4/ppre-context.md written; log store and analytics tool left unset
start: ppre-website | context | human set the failure log store to the VPS
end: ppre-website | context | log store is the VPS; analytics tool still unset; index unchanged
start: ppre-website | context | human chose Umami, self-hosted on the VPS
end: ppre-website | context | analytics tool is Umami; GoatCounter noted as the alternative; index row added
start: ppre-website | context | human asked for a Mermaid picture in the context file
end: ppre-website | context | flowchart inserted after the opening paragraph in docs/c4/ppre-context.md
start: ppre-website | context | human said Coolify is hosted on the VPS
end: ppre-website | context | Coolify moved inside the VPS box; GitHub stays outside
start: ppre-website | context | human said the raw database is not on the VPS
end: ppre-website | context | raw database is in GitHub and CI only; answer files are built locally and pushed; nfr deploy sentence updated
start: root | nfr revise | human asked to clean the reliability row
end: root | nfr revise | runtime failure is a missing answer file on the VPS; the row no longer says a database is unreachable
start: root | observability | human deferred Langfuse
end: root | observability | Langfuse is deferred, not rejected; context, index, and docs/observability.md updated
start: root | observability | human said Langfuse is not used
end: root | observability | status changed from deferred to not used; precomputed answers, no live model calls; build stays on Mohamed's machine
start: root | observability | human asked for one home for the Langfuse decision
end: root | observability | full text stays in docs/observability.md; context and index only point there
start: root | lesson | human accepted the French visitor copy
end: root | lesson | docs/learn/fr.md ends with Status: accepted; no other line changed
start: root | lesson | human accepted the Arabic visitor copy
end: root | lesson | docs/learn/ar.md ends with Status: accepted; no other line changed
start: ppre-website | lesson | human aligned the room bands to scores of 1 to 5
end: ppre-website | lesson | five bands of 0.8 from 1 to 5; schema points at that scale
start: ppre-website | check | human pointed the check at the live site
end: ppre-website | check | .cursor/check-cmd fetches https://insights.sakina.app and looks for a comparison or the room of a hundred
start: ppre-website | lesson | repair attempt 2 failed; host insights.sakina.app does not resolve
end: ppre-website | lesson | draft docs/learn/live-check-needs-dns.md; check left unchanged; no third repair
start: ppre-website | context | human asked to record the VPS address and the DNS still to add
end: ppre-website | context | written in docs/c4/ppre-deploy.md; context and index point there; DNS not changed
start: ppre-website | context | human said the event name’s first part is the target
end: ppre-website | context | first part is a facet or a trait; index already pointed at the context file
start: ppre-website | context | human chose Umami error tracking for the failure log
end: ppre-website | context | caught chart or script failures go to Umami; plain-text form and GlitchTip noted; index row added
start: root | lesson | human accepted the facet glossary
end: root | lesson | docs/learn/ipip-facet-glossary.md status set to accepted; index does not track lesson status
start: root | lesson | human said every decided lesson status becomes accepted
end: root | lesson | answer layout, trilingual responsive, and small-sample warning now say accepted; blank statuses left blank
start: root | lesson | human accepted the remaining lesson files
end: root | lesson | eleven blank statuses and reverse-scoring now say accepted; files that already said accepted were left as they were
