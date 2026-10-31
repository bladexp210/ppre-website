# Problem tree

The map the human and the agent both read. Each node is a deliverable. Cadence is stored on the node, not as one switch for the whole project.

| Field | Values |
| :--- | :--- |
| id | stable name |
| parent | parent id, or none |
| sentence | one sentence |
| depth | vague, framed, or ready |
| priority | an integer, or unset |
| status | now, later, done, or deferred |
| cadence | unset, linear, agile, or hybrid |
| link | ppre-website |

Breadth is the number of sibling branches. Depth is how far one branch has been taken: vague, then framed, then ready, then the six phases after the human links it.

Exactly one node has status now. Later and deferred nodes stay visible so the human can see what is not being solved.

A scarce-resource line sits on the root. Priority uses that line. If the line is empty and more than one branch is open, the next loop is priority, not more breadth.

When cadence is hybrid, the node names two child lists:

- define-now: specified before any of them is built
- discover-as-we-go: built one at a time after the define-now set is accepted

Until a node’s cadence is set, do not open a child and do not link a C4 scope.

Code is not a C4 scope. Levels are system, container, or component. Stack depth max is 3. A deferred sibling has no C4 link.

One discovery pass is one move (breadth OR depth OR priority), then stop.

## Scarce resource

time

## Nodes

### root

- id: root
- parent: none
- sentence: People who read about scientific discoveries, in this case related to the big five personality traits, oversimplify; they don't understand the nuance and form misconstrued opinions; they don't understand what they are reading, they form uneducated opinions, and that's the problem.
- depth: ready
- priority: unset
- status: now
- cadence: linear
- link: ppre-website

Cadence, in the human's words: Revisit the framing and define the problem clearly, with all information gathered, before starting to build the website. Do not begin building until the framing is fully defined and complete.

Filled: who is hurt, in the human's words. Outcome: the reader ends able to understand what the data says without deforming it, retell it in their own words, and explain it to other people. The three abilities are: read the data straight, reformulate it for themselves, and pass it on. Out of scope: version one does not cover the longitudinal data from Understanding Society. Signal: in a blind test, eight out of ten readers correctly identify which Big Five trait a chart is measuring without being told. No child is open.

Source material for later depth passes. It does not set cadence, mark the node ready, or open a C4 scope.

- inbox/project_specification_population_personality_resilience_engine.md
- inbox/ui_ux_design_specification_visual_architecture.md
- inbox/population_personality_resilience_engine.html
