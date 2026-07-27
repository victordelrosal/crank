# The topology layer: harness, loop, graph (2026-07-27)

Ninth capture in research/. Commissioned by Victor on 2026-07-27 after two X articles on the
harness / loop / graph distinction crossed his timeline within a day of each other. Companion to
the round-3 deltas in `skill/SKILL.md` and the frozen delta spec in
`.loop/DELTA-2026-07-27.md`.

**Provenance note, stated up front.** Both sources are X long-form articles, supplied to this run
as pasted text rather than fetched (the X article surface is behind a Premium wall, so no
independent fetch was performed this run). They are therefore captured as ATTRIBUTED SECONDARY
material, not as verified primary sources. Every mechanism adopted from them was accepted on the
strength of the reasoning plus its agreement with sources this repo has already fetched and
verified (Anthropic's harness posts, Karpathy's autoresearch, the Claude Code tool contracts), not
on the authority of the articles. Where an article states a number, the number stays attributed
and is marked UNVERIFIED. Nothing in the skill rests on an unverified figure.

## Source 1: the three layers

**beamnxw** (@beamnxw), "Agent Harness Engineering vs. Loop Engineering vs. Graph Engineering:
a practical guide to the three architecture layers people keep mixing together", X article,
2026-07-25, view count on the paste roughly 392,000 (UNVERIFIED, as with every figure below).

The argument, fairly summarized:

- A raw model cannot hold state, run a test suite, look at a browser, enforce an approval rule, or
  restart a failed job. Every one of those capabilities comes from the environment around it, so
  the interesting engineering is outside the weights.
- **Harness** = the machinery around the model: system prompt, tool definitions, memory,
  filesystem, sandbox, model routing, handoffs, middleware, compaction, permissions, logging,
  verification interfaces. The article credits LangChain with the framing "the agent is the model
  plus the harness" and OpenAI's Agents SDK with the runtime version of the same idea (a runner
  that calls the model, executes tool calls, carries state, and stops only at a real terminal
  condition).
- The article's best single test: delete the model from your architecture diagram, and everything
  left is the harness.
- **Loop** = the repeated work-and-feedback cycle. Every tool-using agent already runs one (call
  model, observe, run tools, feed observations back). Loop engineering is the deliberate stacking
  of further cycles around that: a verification loop with an external grader, an event-driven loop
  woken by a schedule or webhook, an improvement loop that reads traces and edits the instructions.
  Its anatomy: trigger, goal, state, action policy, evidence, feedback, stopping rule.
- The load-bearing sentence, and the one Crank already lives by: **do not loop on confidence, loop
  on evidence.** "The agent says it is done" is not a stopping condition; "the tests pass, the
  links resolve, the schema validates, the reviewer approves" is.
- **Graph** = the topology: nodes, edges, conditional branching, parallel fan-out, joins, bounded
  cycles, human interrupts. State traverses the graph and the shape itself constrains control
  flow. Cites LangGraph (durable execution, state, human-in-the-loop) and Microsoft AutoGen
  GraphFlow (use a graph when you need exact ordering, different next steps per outcome,
  deterministic branching, or cycles).
- They nest: the harness contains the graph, the graph contains loops, and the harness supplies the
  state, tools and evaluators the loops need. That nesting is why people conflate them.
- A symptom-to-layer diagnostic table (reproduced in adapted form in the skill).
- Named mistakes: building a graph before observing how a capable agent actually solves the work;
  letting the same model write and grade without safeguards; using "keep trying" as a loop
  specification; treating the harness as a dumping ground for tools and memory; blaming the model
  for orchestration failures.

**Quality assessment, recorded honestly.** The middle of this article is sound and useful. Its
sourcing is almost entirely framework-vendor documentation describing those vendors' own products,
and its closing section is garbled to the point of incoherence ("Engineering something to be a
model to make it operate"), which reads as unedited generation shipped without a read-through. It
is cited here for the lens and the diagnostic. It is NOT treated as an authority, and no rule
entered the skill on its word alone. Flag: the article states that "loop engineering" arose as a
practitioner term in 2026 and that labels are not yet standardized. That much matches what this
repo already captured in `research/loop-engineering.md` and `research/what-is-a-loop.md`.

## Source 2: the graph mechanics

**Anatoli Kopadze** (@AnatoliKopadze), "Graph Engineering explained: what it is, when to use it and
when not to", X article, 2026-07-24, view count on the paste roughly 804,000 (UNVERIFIED). Opens on a Peter
Steinberger post from 2026-07-18 ("Are we still talking loops or did we shift to graphs yet?"),
the same Steinberger whose June loops argument is captured in `research/loop-engineering.md`.

This is the mechanics article, and it is the one that changed Crank. Its load-bearing content:

1. **Vocabulary.** A node is one job with one input and one output. An edge means one job needs
   what another produced. Nodes do the thinking, edges carry the results. An edge only counts when
   something real passes along it.
2. **The node contract.** One bounded job, a defined input, a defined output shape, enforced. A
   node whose output is a wall of free text is a node only a human can read; a node with a fixed
   output shape is one the next node can consume without guessing.
3. **The fake-edge test.** Walk the workflow step by step and ask, at each step, whether it
   actually needs the result of the one before it. If yes, the edge is real. If no, the wait is
   wasted and the two jobs can run at once. The worked example: "review file A for bugs, then
   review file B" reads as a sequence but B never reads A's output. The claim is that almost any
   real workflow contains two or three fake edges.
4. **Your linear plan is already a graph, just the saddest one.** A 40-step chain has 40 points of
   sequential failure and the latency of all 40 added together; the same 40 jobs drawn honestly
   usually have three to five real dependencies and finish at the speed of the slowest layer. "The
   model was never the bottleneck. The line you drew was."
5. **The diamond: fan out, reduce, synthesize.** Split the work, several workers dig in parallel,
   something checks what they found, everything merges into one answer. Fan out for breadth, reduce
   with plain code to compress, synthesize with a final agent. The article names Claude's own
   research feature as production evidence of this shape, and shows an orchestration script where
   the reduce step is ordinary code with no model call, verification spawns a FRESH skeptic per
   finding, and cheap models sit on the boring nodes with the strong model where judgment lives.
   That last detail is independently confirmed by Crank's own automatic transmission, shipped
   2026-07-16, and by the harness tool contracts read directly this run: the Agent tool takes a
   `model` parameter, and Workflow's `agent()` takes `opts.model` plus `opts.effort` (VERIFIED
   in-harness in the director's session; note that a subagent does not see the Workflow tool, so a
   cold verifier cannot reproduce this one and should treat it as a director-scope check).
6. **The checker is the whole trick.** Never let the agent that did the work check the work, and
   never give the checker the worker's context: "a graph of agents sharing one context is just a
   single loop in a costume". Split the checking across distinct lenses (is it correct, is it
   current, is the source real) because three different lenses catch what ten identical ones miss.
   This agrees exactly with what Anthropic's loop experiments found and Crank already shipped: the
   fresh cold verifier per round.
7. **Where graphs break.** Three failure modes, each with a fix:
   - *Context collapse.* Fan out to a thousand nodes and pour all thousand outputs into one final
     step and you blow the context window before synthesis starts. Fix: layer the fan-in. Batch,
     summarize each batch, combine the summaries, never the raw pile.
   - *False independence.* Two nodes look independent because their prompts never mention each
     other, but they write the same file or hit the same rate-limited API. That is a hidden edge.
     The article reports that when Bun's team first fanned a large job across many agents they
     shared one workspace and overwrote each other. Fix: isolate every worker (its own git
     worktree) and audit shared *resources*, not just shared data. Any two nodes writing the same
     file need an edge, not parallelism.
   - *Silent node failure.* In a chain one failure stops everything, which is annoying but obvious.
     In a graph, one dead node among two hundred slips into a report that looks complete. Fix:
     every merge step counts its inputs against the number it expected and flags the gap instead
     of quietly running on half the data.
8. **When you do not need one.** A graph buys breadth, not judgment. Skip it when the task is small
   or isolated, when you want to approve every step, when the work is exploratory and you do not
   yet know what you are looking for, or when the steps genuinely depend on each other. "The tell
   is the fake-edge test. If you cannot find two jobs with no edge between them, there is no graph
   to build. It is a loop, and a loop is fine."
9. **Anchors, and this is the deepest point in either article.** Build the full graph, paired
   checkers, audit nodes, meta-nodes tuning the other nodes, every node reading another node's
   report, and "everything is consistent, nothing is verified". Such a graph fails exactly the way
   the single loop did, "just later, more expensively, and with far more green lights on the way
   down". Topology alone does not buy truth. The graph needs anchors: things that cannot be argued
   with (tests that actually ran, revenue that landed in the bank, customers who actually stayed),
   plus some rules frozen precisely because an optimizer would be tempted to weaken them. "The
   graph is only as honest as the things inside it that refuse to move."
10. **Cost.** The article's headline case is an engineer using this setup to rewrite the Bun
    runtime: roughly 535,000 lines of one language translated into over a million lines of another
    in about eleven days, roughly 50 workflows, up to 64 agents at once, roughly $165,000 in usage,
    a human designing and watching throughout, and real criticism over whether that much
    AI-written code can be reviewed safely. **All of these figures are UNVERIFIED by this run.**
    They are reported here as attributed claims because the shape of the lesson matters (fan-out
    bills for the breadth it buys), not because the numbers are established. Do not restate them
    without the attribution.

**Quality assessment.** Better sourced in substance than source 1 (its claims are mostly mechanical
and testable rather than definitional), and it is honest about cost and about when not to use the
technique, which is the mark of a practitioner rather than a promoter. It still carries engagement
copy that this run rejected outright: the opening "most people are using AI at 5 to 10% of what it
can actually do" and the framing of graph engineering as "the skill behind real roles at large
companies" are unverifiable, and nothing in the skill rests on them.

## Covers vs lacks: Crank before this round

| Mechanism from the sources | Crank before 2026-07-27 | Verdict |
|---|---|---|
| Loop on evidence, not confidence | Core doctrine since birth; the cold verifier's verdict gates the stop and bet-weights is explicitly not the gate | Covered |
| Worker and checker never share context | Covered: fresh cold verifier every round, sees criteria + artifacts only, told to fail the work | Covered |
| Distinct verification lenses | Partly covered: the hostile-lawyer and perspective lens ideas live in the global LEARNINGS, not the skill | Partly |
| Cheap models on boring nodes, strong where judgment lives | Covered since 2026-07-16: the automatic transmission (fable / opus / sonnet routing, announced gear and shifts) | Covered |
| Fan out for breadth | Covered informally: DECOMPOSE dispatches parallel specialists | Partly, unspecified |
| Reduce with plain code, not a model | Not stated. Scripts-before-verifiers existed for mechanical CHECKS, never for the merge step | **Lacked** |
| The fake-edge test | Not stated. DECOMPOSE said "decide which are parallelisable" and gave no test for deciding | **Lacked** |
| The node contract (defined output shape) | Partly: the three-line builder readback proved comprehension, nothing specified the output shape the next node consumes | **Lacked** |
| Layered fan-in / context collapse | Partly: cap-the-verifier's-payload existed for verification only, not for integration or handoff | **Lacked** |
| False independence / hidden edges / worktree isolation | Not stated. DECOMPOSE assumed "independent, no shared state" without auditing shared resources | **Lacked** |
| Silent node failure / fan-in count guard | Not stated, and this was a real integrity hole: a dispatched agent that dies returns null and gets silently dropped | **Lacked** |
| Anchors: topology does not buy truth | Partly, in pieces: environment-checkable-over-judge-checkable, the frozen evaluation surface, the verifier drives the artifact. Never unified, and nothing forbade a criterion resting entirely on agent reports | **Lacked as a rule** |
| Do not formalize the topology early | Partly: ground-before-frame covered understanding the system, nothing covered not freezing the fleet's shape prematurely | **Lacked** |
| Graph as a durable engine (Workflow, pipeline over barrier) | Not stated. The skill mentioned Workflow once in passing and never said when to prefer it or to prefer pipeline over a barrier | **Lacked** |
| Symptom-to-layer diagnosis | Not stated. Every stuck round was implicitly a loop problem | **Lacked** |

Eleven genuine gaps, which is the largest delta any benchmark round has produced against Crank
since the June launch. The reason is structural: every prior round improved the loop, and this is
the first source material aimed at the shape of the fleet rather than the cycle inside it.

## Adopted, and where each landed

All eleven adopted deltas are specified in `.loop/DELTA-2026-07-27.md` (D1 to D11) and are
greppable in `skill/SKILL.md` by rule name: the layer diagnostic ("Which layer owns the failure"),
the fake-edge test, the node contract, reduce in code, layered fan-in, hidden edges, the fan-in
guard, anchors, do not formalize the topology early, and reach for Workflow when the topology is
real.

## Rejected, with rationale

- **"Graph engineering" as a third Crank mode.** Crank already runs a graph at DECOMPOSE. A third
  mode would be ceremony, and both articles' own best advice is to avoid formalizing topology
  early. Adopt the mechanics, refuse the mode.
- **The three-layer taxonomy as an authority.** Useful lens, vendor-shaped sourcing, incoherent
  closing section. Keep the diagnostic, drop the reverence.
- **"Most people use AI at 5 to 10 percent" and "the skill behind real roles at large
  companies".** Unverifiable engagement copy.
- **Dozens or hundreds of nodes per run as a default scale.** Crank's default stays a small sharp
  fleet. The volume-as-a-proxy-for-value anti-pattern and the scheduled-mode budget ceiling both
  stand unchanged. A thousand-agent fan-out is a capability, not a habit.
- **"A graph of loops where cycles watch and correct each other" as the upgrade path.** This is
  precisely what the anchors rule warns against when the cycles only read each other's reports.
  Verifier chains without anchors are a more expensive way to be confidently wrong. The irony is
  that source 2 makes both the claim and its refutation, twelve sections apart; Crank keeps the
  refutation.
