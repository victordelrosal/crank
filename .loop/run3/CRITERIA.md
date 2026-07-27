# CRITERIA: Crank improves Crank (2026-07-04 round)

Each is binary. E = environment-checkable (script/grep/diff), J = judge-checkable.

1.  (E) A research note exists at research/clineflow-uriostegui.md capturing the article's
    7-step alignment sequence, the ClineFlow journal system, the repo URL, and what Crank
    took vs deliberately rejected.
2.  (E) SKILL.md ORIENT contains a grounding discipline for work on existing systems:
    locate the real artifacts/call sites and state understanding as verified vs assumed
    BEFORE the contract freezes at FRAME.
3.  (E) SKILL.md contains a plan-grounding rule (DECOMPOSE or EXECUTE): builders verify the
    plan's assumptions against the actual artifacts they will touch before building, and
    mismatches land in the assumption ledger.
4.  (E) The director's log is specified: a named file (LOG.md), a per-round entry shape, and
    consistent reference from the resume and scheduled-mode fallback sections (no more
    unspecified "director's log").
5.  (J) Every new addition is the delta only: no Cline-specific baggage imported (file-size
    caps, emoji style guides, commit SOPs, branch SOPs, reference symlinks).
6.  (E) The new source is cited inside SKILL.md the way Lance Martin already is, and the
    research file is listed in the repo.
7.  (J) Voice preserved: reads like the existing skill, no em dashes anywhere in the diff.
8.  (E) ~/.claude/skills/crank/SKILL.md and sBs/crank/skill/SKILL.md are byte-identical
    after the edit (drift repaired and not reintroduced).
9.  (E) The run log (.loop/LOG-2026-07-04.md) contains the panel discussion with named
    positions and a bet-weights table for every candidate change, accepted and rejected.
10. (E) A before/after HTML page is produced via /html showing what changed and why, and is
    delivered to Victor.
11. (E) Changes committed and pushed to github.com/victordelrosal/crank.
12. (E) Global ~/.claude/crank/LEARNINGS.md updated only if a rule was verified this run;
    no speculative rules added.

## Contract extension (Victor interjection, 2026-07-04 mid-run): benchmarking round

13. (E) research/loop-benchmark-2026-07.md exists: a benchmark of 8+ named approaches
    (Karpathy autoresearch, Ralph loop, ClineFlow, Cline Memory Bank, spec-driven harnesses,
    Reflexion, LATS, Voyager, DSPy/GEPA-class optimizers, AlphaEvolve-class evolution) vs
    Crank across loop anatomy, verification, memory, stop/safety; verified sources only,
    UNVERIFIED flagged; states per approach what Crank already covers vs lacks.
14. (E) SKILL.md gains only the panel-accepted round-2 deltas, each traceable to a named
    source in the benchmark, with bet-weights recorded in LOG.md for accepted AND rejected.
15. (E) A fresh cold verifier (verifier #2, no context from verifier #1) passes C13-C14 and
    re-checks C7 (voice, no em dashes) and C8 (copies byte-identical) after the round-2 edit.
16. (E) Round 2 committed and pushed; the /html before/after page covers both rounds and is
    delivered to Victor. (Subsumes C10/C11 sequencing.)

Note (documented contract edit, round 1): C9's file is .loop/LOG.md, renamed from
LOG-2026-07-04.md to comply with the LOG.md spec the run itself authored. Content intact.

## Run 3 (2026-07-27): the topology layer. (E) = environment-checkable, (J) = judge-checkable.

1.  (E) research/graph-engineering-2026-07.md exists and captures both sources with author,
    handle, title and date; marks the provenance of both as attributed secondary (not fetched);
    marks every figure it repeats UNVERIFIED; and carries a covers-vs-lacks table plus written
    rejections with rationale.
2.  (E) skill/SKILL.md DECOMPOSE names the fleet as Crank's graph step and carries the fake-edge
    test, the node contract, the hidden-edge audit with worktree isolation, fan-out-reduce-
    verify-synthesize with reduce in plain code and layered fan-in, the fan-in guard, and when to
    reach for Workflow with pipeline preferred over a barrier.
3.  (E) skill/SKILL.md carries a "which layer owns the failure" diagnostic naming harness, loop
    and graph, stating Crank is the loop and DECOMPOSE is its graph step and the harness is
    Claude Code's, with a symptom-to-layer table of at least 6 rows.
4.  (E) The anchors rule appears in RED-TEAM as a hard rule (not an aside) and is cross-
    referenced from the criteria-writing guidance in FRAME.
5.  (E) A graph-fitness check exists in FRAME as the sibling of the loop-fitness check.
6.  (E) The BRIEF template gains an EDGES field and the LOG round template gains a FAN-IN field.
7.  (E) Two new anti-patterns exist: answering a graph fault with another loop round, and
    consensus dressed as evidence.
8.  (E) Installed ~/.claude/skills/crank/SKILL.md and repo skill/SKILL.md are byte-identical.
9.  (E) .loop/tools/check.sh passes, and its named-rule grep list is extended with the run-3 rule
    names so future runs cannot silently drop them.
10. (E) README.md gains a topology section placed between "The three things the hype skips" and
    "Crank cranked Crank", with zero em dashes, no unverified number stated as fact, and the
    DECOMPOSE bullet extended.
11. (E) The live page gains an id="topology" section between #discipline and #modes, reusing the
    page's existing card pattern, zero em dashes, no new external request, renders in both themes
    with no horizontal overflow at 390px, and a nav link resolving to it.
12. (E) Every rule added to the skill traces to a named source in the capture or to a tool
    contract verified in-harness; no rule enters unsourced.
13. (J) A fresh cold verifier judges that the skill gained discipline and not ceremony. Rubric:
    every added rule names a trigger, an action and a source; the skill stays navigable; nothing
    added restates a rule the skill already had.

Note (documented contract edit, run 3, 2026-07-27): C11 was frozen at FRAME saying the new page
section sits "between #discipline and #modes". Grounding was incomplete on this one point: #modes
exists only in the stale local clone of victordelrosal.com, not on origin/main, which is the tree
that actually ships. The real neighbour is #upgrade, so the section sits between #discipline and
#upgrade and the intended argument order (mechanism, discipline, topology, proof) is preserved.
Recorded here as well as in LOG.md per the run-1 precedent, so a future re-verification against
the frozen contract does not fail on an anchor that never existed.

Note (run 3): C11's "reusing the page's existing card pattern" was satisfied as reuse plus scoped
extension: the .rules/.rule/.pin/.src chassis is reused unchanged, and four #topology-scoped CSS
rules plus one shared .rule .n label class were added. Stated rather than glossed.
