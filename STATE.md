# STATE

Session pointer. The map is `docs/problem-tree.md`. If they disagree, the map wins.

## Now

- id: root
- parent: none
- sentence: People who read about scientific discoveries, in this case related to the big five personality traits, oversimplify; they don't understand the nuance and form misconstrued opinions; they don't understand what they are reading, they form uneducated opinions, and that's the problem.
- depth: ready
- priority: unset
- status: now
- cadence: linear
- link: ppre-website

Cadence, in the human's words: Revisit the framing and define the problem clearly, with all information gathered, before starting to build the website. Do not begin building until the framing is fully defined and complete.

Exactly one node has status now. This root is that node.

## Scarce resource

time

## C4 stack

- id: ppre-website
- level: container
- name: the PPRE website
- phase: 3
- parent: root
- file: docs/c4/ppre-website.md

This is the first container. It is the website itself.

See docs/index.md.

Code is not a C4 scope. Stack depth max is 3. A deferred sibling has no C4 link.

## Check command

See docs/index.md.

## Observability

See docs/index.md.

## Source material

These inbox specs fed the depth pass that named who is hurt. They do not set cadence, mark the node ready, or open a C4 scope. Later depth passes may read them again.

- inbox/project_specification_population_personality_resilience_engine.md
- inbox/ui_ux_design_specification_visual_architecture.md
- inbox/population_personality_resilience_engine.html

## Design rules

See docs/index.md.

## Next

Cadence on the root is linear. The architecture link is `ppre-website`. The open scope is that container at phase 3, Build. Mohamed accepted the blueprint on 31 Oct 2026. Build has not been started. Repair cannot start. See docs/index.md.
