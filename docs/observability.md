# Observability

Two decisions. The agent recommends. The human decides. Bootstrap does not install a product telemetry stack and does not send a trace.

## Product observability

Decision: logs

When something doesn't work well on the site — for example a chart failing to render or a script error — it is sent to Umami on the VPS, not only shown to the visitor. See docs/index.md. This matches the filled row in `docs/nfr.md`. It builds on the safe failure rule.

## Workflow observability

The local record is the problem tree, the C4 stack, and `docs/loop-log.md`. Each loop writes one start line and one end line, including which tree node moved and whether the move was breadth, depth, or priority.

Decision: not used

Langfuse is not used. The site serves precomputed answers, with no live model calls at runtime. Answer building happens on Mohamed's machine before deploy. No cloud call is made. The local log remains.
