# The memory layer: knowledge graphs for agentic systems (2026-07-27, run 4)

Tenth capture in `research/`. Source PDF alongside this file at
`research/knowledge-graph-playbook-anthropic-2026-07.pdf`, imported by Victor on 2026-07-27
evening, hours after run 3 closed. Companion to the run-4 deltas in `skill/SKILL.md`.

## Provenance note, stated up front

**"The Knowledge Graph Playbook for Agentic Systems: Anthropic Engineering Guide"**, an
independently compiled July 2026 synthesis. Its own footer says it is "not a publication of, and
is not affiliated with or endorsed by, Anthropic".

Standard it meets: **ATTRIBUTED SECONDARY**, the same tier as run 3's two X articles, with one
upgrade and one downgrade.

The upgrade is real. Unlike either X article, its cited primaries exist and are fetchable, and a
panel member fetched them this run. VERIFIED by direct fetch 2026-07-27:

- `anthropics/claude-cookbooks`, path `capabilities/knowledge_graph/`, README titled exactly
  "Knowledge Graph Construction with Claude", containing `guide.ipynb`, `data/sample_triples.json`,
  `data/alias_map.json`, `evaluation/eval_extraction.py`. The two-model split is in the notebook as
  `EXTRACTION_MODEL = "claude-haiku-4-5"` and `SYNTHESIS_MODEL = "claude-sonnet-4-6"`.
- "Building Effective Agents", anthropic.com/engineering/building-effective-agents, Zhang and
  Schluntz, 19 December 2024.
- "Scaling Managed Agents: Decoupling the brain from the hands", Martin, Cemaj and Cohen, Anthropic
  Engineering, 8 April 2026.
- The MCP Knowledge Graph Memory Server, `modelcontextprotocol/servers/src/memory`, active.
- Structured outputs (constrained decoding) on platform.claude.com. Note the guarantee is schema
  validity, never factual accuracy.

The downgrade is more serious than the upgrade, and it is why nothing entered the skill on this
document's authority. It wears an authority it does not have: its title page reads "Anthropic
Engineering Guide" with the disclaimer beneath in smaller type, and its abstract claims "we ground
every claim in Anthropic's public cookbook, engineering blog, and API documentation". Neither is
true of the document as a whole. Four specific defects, each found by fetching the source it names:

1. **The foundational quotation could not be located.** The document motivates the entire
   discipline with a quotation attributed to Anthropic's engineering team: "context grows too
   complex for one agent to manage effectively, creating performance bottlenecks as agents struggle
   to maintain coherence." NOT FOUND in the Managed Agents post or in any Anthropic publication
   searched this run. The nearest real sentence is "Long-horizon tasks often exceed the length of
   Claude's context window, and the standard ways to address this all involve irreversible
   decisions about what to keep", which is a different claim.
2. **The precision figure is misread.** The notebook prints two per-document rows (`Apollo 11
   P=1.00 R=0.55`, `Neil Armstrong P=1.00 R=0.38`). The document reports 1.00 as a corpus score and
   glosses it "everything Haiku extracted was correct". The same repo's `evaluation/README.md`
   documents expected entity precision of 0.80 to 0.90, which the document does not mention.
3. **The five agent patterns are misstated.** "Building Effective Agents" gives the augmented LLM
   as a building block and then five workflows: prompt chaining, routing, **parallelization**,
   orchestrator-workers, evaluator-optimizer. The document promotes the building block into the
   pattern set and silently drops parallelization to hold the count at five. The pattern it dropped
   is precisely the one the topology sense of "graph engineering" is about.
4. **The layered stack is not Anthropic's.** A direct search of Anthropic's engineering writing
   this run found no four- or five-layer stack of any kind. Anthropic publishes the pieces (context
   engineering, harness design, the agent patterns, Managed Agents) and not the ladder. The
   framing appears to originate with a third party and propagate through secondary sites.

Structural signals of the same class run 3 flagged in beamnxw: the Conclusion appears at section
XVI followed by sections XII through XVIII, two different tables are both numbered TABLE III, and
sections X and XI are missing from the sequence.

**Never restate as fact:** the 1.00 precision claim; "k=2 with a cap of 200 triples" as an
enterprise sweet spot (no source); "prompted extraction matches or exceeds trained-model quality"
(no benchmark cited); the "NetworkX to a few hundred thousand edges" figure; the four monitoring
signals and their thresholds; and the opening quotation in defect 1 above.

## The collision: one word, two disciplines

Run 3 (2026-07-27, 01:40) adopted "graph" as a defined term meaning **topology**: nodes are agent
runs, edges are artifact dependencies, the graph is traversed once and discarded. This document,
imported at 20:57 the same day, uses "graph engineering" for the **shared memory layer**: nodes are
entities, edges are typed relations with provenance, the graph is queried repeatedly and its whole
value is that it survives the run.

Adjudicated by the panel as two genuinely different disciplines wearing one name, neither a special
case of the other. Different node types, different edge semantics, different lifetimes, different
failure modes (fake edges and fan-in holes on one side; under- and over-resolution on the other),
different literatures. They share the mathematics of nodes and edges the way a call graph and a
social graph share it, and nothing else.

Three further points argued the topology reading has the better claim to the bare word:

- In the sibling terms, "X engineering" names the artifact the engineer shapes by hand at that
  layer. You write the prompt, you choose the context, you design the loop, you draw the graph.
  In the memory sense the graph is the *output* of a pipeline you shape, not the thing you shape.
- The memory discipline already has an older, more precise name: knowledge graph construction.
- Anthropic's own cookbook, this document's primary source, calls it "Knowledge Graph Construction
  with Claude" and never uses the phrase "graph engineering". The term is the compiler's coinage
  laid over a source that declined to coin it.

Crank's resolution is local and cheap: pin the word once, in the section a future agent is already
reading when the ambiguity can bite. Adopted as the "One word, two disciplines" paragraph in
"The three layers: which one owns the failure".

## Covers vs lacks: Crank before run 4

| Playbook mechanism | Crank status | Evidence | Verdict |
|---|---|---|---|
| Two-model strategy: cheapest model that handles the subtask | Covered | "The transmission: automatic model routing" / "Route by task shape, not by mood or habit" | Confirmation only |
| Cost profile per stage, optimized independently | Covered | "Flat-rate does not mean free" | Confirmation only |
| Structured outputs as the interface contract between stages | Covered | "node contract": one bounded job, a defined input, and a defined output shape | Confirmation only |
| Grounded evaluator: check claims against a fact store, cite the evidence | Covered | "Anchors: topology does not buy truth", plus the verifier stating evidence of failure per criterion | Confirmation only |
| Anti-pattern: the ungrounded evaluator (has access, never checks) | Covered | "Consensus dressed as evidence" | Confirmation only |
| Anti-pattern: the context dump (serialize everything into one step) | Covered | "Cap the verifier's payload" and "layered fan-in" | Confirmation only |
| Anti-pattern: the write-only store (written, never queried) | Covered | "Consult before deriving" | Confirmation only |
| Anti-pattern: the stale store (built once, never updated) | Covered | "Prune on write" | Confirmation only |
| Anti-pattern: the phantom store (ontology before needs) | Covered | "Graph-fitness check" and "do not formalize a topology you have not watched run" | Confirmation only |
| Anti-pattern: the monolith extract (one prompt, attention split) | Covered | "A fleet of three sharp specialists beats seven generalists every time" | Confirmation only |
| Subgraph sizing: cap what one reasoning call receives | Covered | "Cap the verifier's payload" | Confirmation only |
| Decision framework: each layer earns its complexity | Covered | "Graph-fitness check" ("It is a single loop, and a single loop is fine") | Confirmation only |
| Extraction cap: bounded per-run cost | Covered | "A hard budget ceiling that aborts" | Confirmation only |
| Incremental construction: accumulate, do not rebuild | Covered | "Distill before you hand off (the memory loop)" | Confirmation only |
| Corpus-quality limit: the world model is only as good as its sources | Covered | "Optimizing a misunderstood contract" | Confirmation only |
| Graph sits alongside the loop, not above it | Covered | "Crank is the loop, and DECOMPOSE is its graph step" | Confirmation only |
| **Provenance immutability: every claim traces to a source, write-once** | **Partly** | Append-only stated for the run journal only. Grepped "provenance", "immutab", "append-only", "traceab" in SKILL.md: absent. The durable memory that gates future runs required only the adjective "verified", with no requirement that a line carry the evidence that verified it | **ADOPTED (D1)** |
| **Read/write separation: evaluators read-only** | **Lacked** | Grepped "read-only", "read/write", "write access": absent. The frozen-surface rule bound the builder one way only; nothing forbade the verifier touching what it grades | **ADOPTED (D2)** |
| **Human sample review: "read a sample, always"** | **Partly** | Grepped "sample": one hit, the loop-fitness direction checkpoint, which fires only on judge-heavy criteria in round 1. The handoff was seven prose items plus paths; no raw output reached Victor by default, and scheduled mode compounds this nightly | **ADOPTED (D3)** |
| **The word "graph" itself** | **Lacked** | SKILL.md defined "graph" as topology with no definitional guard against the rival sense | **ADOPTED (D4)** |
| Evaluation harness with a gold set and precision/recall | Partly | `CRITERIA.md`, the frozen evaluation surface and `.loop/tools/check.sh` already play this role; a numeric regression metric is the KG-specific instantiation | Refused |
| Production readiness checklist (ten elements) | Partly | Duplicates `check.sh` plus per-run criteria; a second checklist is volume as a proxy for value | Refused |
| Four monitoring signals (extraction rate, compression ratio, components, latency) | N/A | Instrumentation for a continuously-running pipeline. Crank runs are bounded and already have three hard stops | Refused |
| Entity resolution (under- and over-resolution) | N/A | No entity store. The parallel-work analogue is "Audit for hidden edges before calling anything independent" | Refused |
| Entity summarization into a world model | N/A | Presupposes a node store to pool over. Crank's cross-run synthesis is rule-shaped, not entity-shaped | Refused |
| MCP as agent-to-store connectivity | N/A | Harness scope, which Crank explicitly declines to own | Refused |
| Query scope, per-edge access-control tags | N/A | Single-tenant on Victor's machine; "Least privilege, re-audited" already covers the real exposure | Refused |
| Precision-versus-recall tuned to the consumer | N/A | Criteria-count-scaled-to-work-shape already does this job in FRAME | Refused |
| **Memory as a queryable store with a retrieval move, not a flat dump** | **Lacked** | Grepped SKILL.md for "index", "shard", "retriev", "query" against the memory loop: absent. ORIENT said only "consult the global file", with no shape and no cap, and the file had reached 738 lines | **ADOPTED (D5)** |
| **Retiring facts into the environment rather than holding them as prose** | **Partly** | "Distill tools, not only rules" existed since 2026-07-04 and covered PROMOTING an instrument the run happened to build. Grepped for any rule about CONVERTING an existing prose rule into a tool and archiving it: absent, and `~/.claude/crank/tools/` did not exist at all. Folded into the existing bullet in round 2 rather than added as a second one, on the cold verifier's finding that a separate bullet restated its neighbour | **ADOPTED (D6, merged)** |
| **A knowledge graph as Crank's memory layer** | **Lacked, deliberately** | See the verdict below | **Refused, argued** |

Four genuine gaps against a document of roughly thirty mechanisms, and sixteen rows where Crank
already had the mechanism under another name. That ratio is the finding, not the deltas.

## The verdict on the memory layer

**Crank does not need a knowledge graph.** Argued from the document's own decision framework
(Table III, "when to use a knowledge graph vs alternatives") applied to Crank's actual scale, and
from its own closing rule that "each layer earns its complexity by solving a problem the layers
below it cannot":

- **Multi-hop reasoning: Crank does not have it.** Census of all 179 rules in the global craft
  memory: every rule is a self-contained conditional of the form "when X, do Y (verified:
  evidence)". Not one references another rule by identifier, and there are no entities to traverse
  between. The only question ever asked of this memory is one hop deep. `grep` answers a one-hop
  lookup exactly and deterministically; a graph answers it after you pay for a schema, an
  entity-resolution policy, and a query language.
- **Cross-agent state sharing: Crank deliberately does not have it, and adding it would regress the
  most load-bearing property in the skill.** The fleet is 3 to 5 agents that never talk to each
  other; the node contract exists precisely so no node needs another's in-flight state, and the
  filesystem already has every property the document attributes to shared memory. More sharply, the
  cold verifier's honesty comes from context isolation. A shared, agent-writable store that the
  verifier also reads is a channel by which the builder's framing reaches the grader.
- **Provenance-carrying fact-checking: Crank genuinely has this problem and already solved it more
  strictly.** The house format `(verified: project, date, evidence)` carries the same payload a
  typed provenance edge would. And the anchors rule goes further than the document does: Crank does
  not turn the evaluator into a fact-checker over a store, it forbids any criterion from resting on
  agent reports at all. A store of typed facts written by agents is a thing that can argue back,
  and an evaluator checking against it would let internal consistency impersonate an anchor. That
  is exactly what run 3 refused under "a graph of loops where cycles watch and correct each other".
- **Scale.** 179 facts, one writer per run, roughly 25 days of history. A graph amortizes fixed
  cost over thousands of facts and concurrent writers. At this scale the schema is larger than the
  corpus.

**The premise to attack:** that Crank's agents never need each other's in-flight state. This holds
at 3 to 5 agents fanning out from one director through a filesystem. It stops holding at the scale
run 3 explicitly rejected as a default (dozens of concurrent agents, the Bun-rewrite case). If
Crank ever runs that wide, false independence becomes a live integrity problem and this answer
flips.

**What Crank did have was a memory-layout failure, not a missing layer.** See the next section.

## The live failure the lens exposed

Applying the document's "context dump" anti-pattern to Crank's own memory found a real defect,
measured this run:

| Measure | Value |
|---|---|
| `~/.claude/crank/LEARNINGS.md` | 738 lines, 69,859 bytes, 179 rules |
| `skill/SKILL.md` for comparison | 776 lines, 56,473 bytes |
| Global memory vs the skill, by bytes | 1.24x larger |
| Global memory vs its own workspace file | 39x larger |
| Rules over 200 chars | 159 of 179 (89%) |
| Section headers named by run rather than topic | 8 of 12 |
| `~/.claude/crank/tools/` (promised by the skill since 2026-07-04) | did not exist |

The skill's own rule for that file said "readable in under a minute". It truncated when read into a
context this session. Diagnosis: the file was a journal being used as an index, ordered by
chronology, with no retrieval move and no forcing function on write. Appending is free and pruning
is unpaid, so it only ever grew.

Fixed in run 4 (see `skill/SKILL.md`, "The global file is an index, not a journal"): the index
holds at most 30 ALWAYS rules plus a shard table, craft rules live in seven topic shards capped at
60 rules each, promotion costs a demotion, evictions go verbatim to `learnings/ARCHIVE.md` with one
of three stated reasons, and `~/.claude/crank/tools/learnings-check.sh` gates it. All 179 rules
were relocated, counted in and counted out, with a verbatim pre-shard copy retained. The new gate
immediately caught five em dashes that had been sitting unnoticed in the old flat file.

## Rejected, with rationale

- **A knowledge graph, a typed entity schema, or provenance edges.** Argued above. The inline
  provenance clause carries the same payload at zero infrastructure cost.
- **An evaluator that fact-checks against the store.** The document's marquee promise and the one
  Crank must refuse hardest: it would let internal consistency impersonate an anchor.
- **Any shared, agent-writable memory both builders and verifiers touch during a run.** Context
  isolation is what makes the cold verifier honest.
- **Embedding or vector retrieval over the rules.** Nondeterministic and unauditable over a corpus
  where `grep` is exact and the point is that a cold agent can prove what it read.
- **A memory-curating meta-agent.** Unanchored by construction (its output is judged by nothing in
  the environment), it bills every run, and it is volume as a proxy for value with a nicer title.
  The eviction rule does the same work for one sentence of discipline.
- **The document as an authority.** Its primaries are real and worth reading first-hand; the
  document itself misstates three of them.

## The unpaid debt, named

The highest-leverage move nobody executed: **conversion**. Of 179 rules, 50 are about browsers and
rendering, and roughly a dozen of those are not rules at all, they are the missing arguments to one
headless-screenshot command (the swiftshader flag for WebGL, the 500px Rosetta clamp, never
wrapping Chrome in `timeout` because macOS has none, cropping with PIL afterward). Each was paid
for with a wasted round, written in careful English, and then had to be read, understood, and
correctly applied by a cold agent under context pressure, which is the step that failed this
session. The skill has said "distill tools, not only rules" since 2026-07-04 and the `tools/`
directory did not exist until tonight. A `tools/shoot.sh` that bakes those flags in would retire
ten to twelve rules outright, and a rule retired into a working script cannot be truncated,
skimmed, or misapplied, because the agent never has to know it. Adopted as a rule in run 4
("Retire rules into tools"); the script itself is named as the next candidate and was not built.
