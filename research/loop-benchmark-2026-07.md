# Loop-harness benchmark: Crank vs the field (2026-07-04)

Eighth capture in research/. Commissioned by Victor mid-run ("I am certain there are many
other similar approaches to crank and clineflow out there"). Three parallel research agents;
every source below was fetched and verified on 2026-07-04 unless marked UNVERIFIED. Panel:
Theo, Lars, Mythos, Claudus. Companion to the round-2 deltas in skill/SKILL.md.

## The field, one row each

| Approach | Loop anatomy | Verification | Memory | Stop/safety |
|---|---|---|---|---|
| Karpathy autoresearch (github.com/karpathy/autoresearch, ~Mar 2026) | Greedy hill-climb: mutate train.py, run under fixed 5-min budget, keep if val_bpb improves, git reset if not | Single scalar metric; eval fn + data prep frozen (anti-cheat) | Git commit per experiment + append-only results.tsv | None by design: program.md instructs "do NOT pause to ask the human", run until human interrupt |
| Ralph Wiggum loop (ghuntley.com/ralph + official Anthropic plugin) | while-true same prompt, fresh context each pass; fix_plan.md mutable TODO; specs frozen | "Back pressure": tests, compile, static analysis each pass | Filesystem only: git, fix_plan.md, CLAUDE.md | fix_plan exhaustion; plugin adds --max-iterations + completion-promise string |
| ClineFlow (hassanvfx/clineflow) | 7-step alignment before implementation | Human verifies agent's mental model | Per-feature journals; context-window handoff protocol | Human-driven |
| Cline Memory Bank (docs.cline.bot) | Session-boot protocol, not a loop | None built in; human-audited | 6 hierarchical files, root-first re-orientation (state, not chronology) | Human-driven |
| GitHub Spec Kit (github/spec-kit) | constitution - specify - clarify - plan - tasks - analyze - implement | /analyze cross-artifact consistency gate pre-implement | Constitution in .specify/memory/ | Human review each phase |
| AWS Kiro (kiro.dev) | Prompt - requirements.md (EARS notation) - design.md - tasks.md, task-by-task | Event-driven hooks (lint/tests/security on save/commit), independent of agent intent | Specs bidirectionally synced with code | Human triggers tasks; deterministic hook gates |
| BMAD-Method (bmad-code-org) | Planning agent roles - Scrum Master shards epics into self-contained story files - dev per story | TEA test-architect role + acceptance criteria | Story files ARE the context transfer | Human gates between roles |
| Task Master (eyaltoledano) | PRD - tasks.json - dependency-graph-driven next-task selection | Status transitions; light grading | .taskmaster/ persists across sessions | Human cadence |
| Anthropic harness v1 (anthropic.com/engineering/effective-harnesses-for-long-running-agents) | Initializer builds immutable JSON feature ledger (passes:false per feature); coder sessions pick highest failing feature | Mandatory e2e as a user (browser automation); tests may not be edited or removed | Feature JSON + progress file + git; full context resets | Ledger prevents premature victory |
| Anthropic harness v2 + best practices (anthropic.com/engineering/harness-design-long-running-apps; ladder from code.claude.com/docs/en/best-practices) | Planner - Generator (sprints) - external Evaluator; sprint contract agreed pre-work | Fresh-context skeptic drives the app (Playwright), hard thresholds; escalation ladder ending in deterministic Stop hooks (best-practices doc) | File-based inter-agent messaging; spec + git | Thresholds, diminishing-returns cutoff, auto-mode classifier |
| Reflexion (arxiv 2303.11366) | Try - env feedback - verbal self-reflection - retry with reflections in context | Env feedback | Episodic lessons buffer | Episode budget |
| LATS (arxiv 2310.04406) | MCTS over trajectories; branch, score, backpropagate | LM self-eval + env feedback per node | Tree within episode | Rollout budget |
| Voyager (arxiv 2305.16291) | Curriculum proposes task - write code skill - env-verify - store | Execution + self-verification | Ever-growing executable skill library | Curriculum-driven |
| Self-Refine (arxiv 2303.17651) | Generate - self-critique - revise | Self only (plateaus; pair with real verifier) | None | Stopping criterion |
| SWE-agent (arxiv 2405.15793) | Edit - lint/test - read feedback - re-edit via purpose-built agent-computer interface | Real execution | None across tasks | Task budget |
| OpenHands (arxiv 2407.16741) | Event stream: act - sandboxed exec - observe - iterate | Actually running the code | Condensed in-session history | Task-done |
| DSPy (arxiv 2310.03714) | Compiler searches demos/instructions against a metric on a trainset | User metric on examples | Compiled prompts persist | Optimizer budget |
| GEPA (arxiv 2507.19457) | Genetic-Pareto prompt evolution; LLM reflects in words on failures, mutates prompt | Pareto frontier across examples | Evolved prompt | Rollout budget (35x fewer than RL) |
| Darwin Godel Machine (arxiv 2505.22954) | Agent rewrites own code; archive of ALL variants; branch from any | Benchmark scores | Open-ended archive (never overwrite) | Compute budget |
| AI Scientist (arxiv 2408.06292) | Ideate - experiment - write - automated reviewer gates | LLM reviewer vs acceptance criteria | Papers + reviews | Reviewer gate |
| AlphaEvolve (arxiv 2506.13131) | Evolutionary code diffs scored by automated evaluators | Machine-gradable metrics only | Program database as prompt context | Generation budget |
| STOP (arxiv 2310.02304) | Improver program improves programs, then itself | Utility function | Improved improver persists | Utility check |
| AWM (arxiv 2409.07429) | Induce reusable workflows from own successful trajectories | Success-rate downstream | Workflow memory injected forward | Online |

UNVERIFIED and excluded from all claims above: secondary coverage of autoresearch (Fortune
2026-03-17 headline, X repost figures such as "700 experiments in 2 days"); Karpathy's
original X post itself (unfetchable). Only the repo README and program.md ground the row.

## What Crank already covered before this round (no change)

Verifier-gates-the-stop and fresh-verifier-per-round (Anthropic v2's external skeptic, AI
Scientist's reviewer gate); frozen binary criteria with documented downgrades (Anthropic v1's
untouchable ledger, in doctrine if not in JSON); LEARNINGS memory progression (Reflexion,
and Lance Martin's fail-investigate-verify-distill-consult); environment-checkable-criteria
preference (SWE-agent, OpenHands, AlphaEvolve's only-evolve-what-a-machine-can-score);
structural-vs-scalar with regression resilience (Lance Martin); ClineFlow's grounding and
journaling (absorbed in round 1 of this run: ground-before-frame, plan-grounding, LOG.md);
Self-Refine's documented plateau (unchecked self-critique is the mechanism Crank's cold
verifier exists to replace); GEPA's reflective mutation in spirit (DECIDE's read-the-raw-trace
and aim-the-next-self-prompt-at-the-divergence); BMAD's story-file-as-context-package
(DECOMPOSE's crisp briefs with owned criteria plus the readback); Task Master's
dependency-graph sequencing (DECOMPOSE's interfaces and parallel-vs-sequential call); DSPy's
metric-driven prompt search (out of Crank's scope by design; the house autoresearch and
evo-autoresearch skills own that job); append-only run ledger
(Karpathy's results.tsv = LOG.md, added in round 1 of this very run); scripts-before-verifiers
(Kiro hooks, in advisory form until this round); loop-fitness check (the field's consensus
that loops need fixed feedback signals); STATE.json + ceiling in scheduled mode (Ralph plugin
max-iterations, Anthropic budget discipline); self-prompt template (Karpathy's program.md
shape); STOP's improve-the-improver (this run is literally Crank cranking Crank).

## Round-2 deltas taken (panel-accepted, bet-weights in .loop/LOG.md)

1. Baseline before you improve (Karpathy: mandatory baseline run) - 85%.
2. Frozen evaluation surface + scripts as a blocking gate (Karpathy's immutable eval fn;
   Anthropic/Kiro deterministic gates) - 85%.
3. The verifier drives the artifact (Anthropic v1 e2e-as-a-user, v2 Playwright skeptic) - 82%.
4. Distill tools, not only rules (Voyager skill library, AWM workflow memory) - 80%.
5. DECIDE option (e): fork best-of-N candidates when a criterion resists iteration
   (LATS branching, DGM archive-and-branch, judge-panel selection) - 72%, cost-caveated.
6. Readback gains a verification clause (Anthropic v2 sprint contract) - 65%, one clause.

## Deliberately rejected

- Karpathy's never-stop directive: the exact failure Crank's checkpoint gates exist to
  prevent; autonomy inside the round, gates at the boundary.
- Single-scalar fitness: right for training runs, wrong for multi-criteria deliverables.
- Full MCTS (LATS) and population evolution (DGM, AlphaEvolve) at scale: thousands of
  rollouts; the transferable kernel is small-N forking, taken above.
- Memory Bank's 6-file hierarchy and Spec Kit's constitution: BRIEF/CRITERIA/LOG plus
  CLAUDE.md/COMPASS already occupy these slots; duplicate state files drift.
- EARS requirement notation: binary criteria are already the house dialect for the same job.
- Backpressure asymmetry as skill text (Ralph's 500-readers-1-builder): real, but the
  Workflow doctrine and DECOMPOSE interface rules already carry it.
