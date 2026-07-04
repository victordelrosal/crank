# LOG: Crank improves Crank (Uriostegui/ClineFlow round), 2026-07-04

## Round 0 (ORIENT + FRAME grounding)
Artifacts located: ~/.claude/skills/crank/SKILL.md (installed, 511 lines), sBs/crank repo
(skill/SKILL.md, research/ 5 sources incl. Lance Martin, .loop/ from June launch run).
VERIFIED: installed skill is AHEAD of repo copy; 2026-07-02 edits (global LEARNINGS,
model-mix, scripts-before-verifiers, know-your-model) never synced (diff run, exit 1).
VERIFIED: article fetched; clineflow repo cloned to scratchpad and PROCEDURES.md,
JOURNAL_TEMPLATE.md, WORKING_WITH_CLINE.md read directly.
ASSUMED: nothing load-bearing left assumed; source and target both read in full.

## The panel (judgment record)

Candidates extracted from the article + repo:
- A. Ground-before-frame at ORIENT (locate + explain-back, VERIFIED vs ASSUMED marks).
- B. Ground-the-plan at EXECUTE (builders check plan vs real artifacts pre-build).
- C. Specify the director's log as LOG.md with a fixed per-round entry shape.
- D. Builder readback opening every fleet report (3 lines: understanding/approach/assumptions).
- E. Anti-pattern: optimizing a misunderstood contract.
- F. Per-feature journal hierarchy. G. File-size/commit/branch/version SOPs. H. Emoji style.

Theo (Principal Engineer): A+B are "read the code before you plan" made mandatory; frozen
criteria make ungrounded FRAME uniquely expensive (one wrong model at minute one buys three
rounds of polishing the wrong thing). Skill is 511 lines: D earns one sentence, not a section.
F-H hard reject: Cline baggage, COMPASS and the harness own that ground.

Lars (Professor): C is the indefensible one. "Resuming a long run" cites a director's log that
no section defines: a resume contract referencing an undefined artifact. Fix with a named file
and fixed entry shape. New source must be cited in-skill exactly as Lance Martin is
(citation-integrity).

Mythos (Resident Frontier Mind): the article's surface reading is "align with the human before
implementing", and Crank deliberately removed the human. The transferable insight: move the
alignment burden onto ground truth. Uriostegui's human verifies the agent's mental model; in
Crank, reality is the verifier, so the explain-back is addressed to the artifacts, not Victor.
Import the mechanics, not the ceremony. ClineFlow's journal survives translation because cold
resume is the same problem in both worlds.

Claudus (hands): the drift found at ORIENT (installed vs repo, 3 weeks) is live evidence for C
and yields a LEARNINGS rule: dual-homed skills sync both copies in the same round.

## Bet-weights table (evidence before bet; decided pre-execution)

| Change | Bet | Verdict |
|---|---|---|
| A. Ground-before-frame (ORIENT) | 88% | ACCEPT |
| C. LOG.md specified | 85% | ACCEPT |
| B. Ground-the-plan (EXECUTE) | 80% | ACCEPT |
| E. Anti-pattern: misunderstood contract | 75% | ACCEPT |
| D. Builder readback (one sentence in DECOMPOSE) | 70% | ACCEPT |
| F. Per-feature journal hierarchy | 25% | REJECT (per-mission LOG.md suffices) |
| G. File-size/commit/branch/version SOPs | 15% | REJECT (COMPASS + harness own this) |
| H. Emoji scanning style | 5% | REJECT (violates house style) |

## Round 1 (2026-07-04)
HYPOTHESIS:   structural: absorb the grounding discipline + journal spec (A-E) into SKILL.md;
              repair installed-vs-repo drift.
DID:          8 edits to ~/.claude/skills/crank/SKILL.md (ORIENT grounding block, EXECUTE
              plan-grounding block, DECOMPOSE readback sentence, new "The director's log
              (LOG.md)" section, anti-pattern line, 3 LOG.md consistency fixes); wrote
              research/clineflow-uriostegui.md; synced skill/SKILL.md from installed.
ASSUMPTIONS:  named the run-log file LOG.md (article/repo use per-feature journals; Crank is
              per-mission). Kept LOG.md spec out of scheduled mode's STATE.json contract
              (machine resume unchanged). Old .loop BRIEF/CRITERIA overwritten, git history
              preserves them.
VERDICT:      cold verifier (fresh agent, CRITERIA + artifacts only): PASS on C1-C9 and C12,
              C10/C11 N/A-DEFERRED by sequencing. 5 defects, none contract-breaking: (1) run
              log named LOG-2026-07-04.md while the new spec mandates LOG.md; (2) "fifth
              research source" miscount (is the seventh); (3) Round 0 entry shape undefined +
              "round-zero" naming both BRIEF and LOG entry; (4) verified LEARNINGS rule
              announced but not written; (5) research note untracked until commit.
DECIDE:       fix all 5 before ship. Defect 1 fixed by renaming this file to LOG.md; C9's
              filename reference is hereby a DOCUMENTED CONTRACT EDIT (path changed, content
              intact), surfaced in the handoff. Defect 2 fixed (seventh capture). Defect 3
              fixed (Round 0 shape added to the LOG spec; BRIEF heading retitled "the BRIEF.md
              template"). Defect 4 fixed (dual-homed sync rule written to global LEARNINGS).
              Defect 5 resolves at commit. Then commit + push (established practice for this
              public repo since the June launch) and open Round 2: Victor interjected mid-run
              with a scope extension (Karpathy autoresearch + broader loop-approach
              benchmarking), which extends the contract; BRIEF v2 + criteria 13-16 appended
              as a documented contract extension.

## Round 2 (2026-07-04, contract extension: field benchmark)
HYPOTHESIS:   structural: benchmark Crank against the wider field (3 parallel research
              agents: Karpathy autoresearch incl. local skills + primary repo; practitioner
              harnesses Ralph/MemoryBank/SpecKit/Kiro/BMAD/TaskMaster/Anthropic v1+v2;
              academic Reflexion/LATS/Voyager/SelfRefine/SWE-agent/OpenHands/DSPy/GEPA/
              DGM/AI-Scientist/AlphaEvolve/STOP/AWM), absorb only the mechanisms Crank lacks.
DID:          research/loop-benchmark-2026-07.md (eighth capture, 23 approaches, all sources
              fetch-verified); 6 edits to SKILL.md: (1) Baseline before you improve [ORIENT],
              (2) scripts as blocking gate + frozen evaluation surface [RED-TEAM], (3) the
              verifier drives the artifact [RED-TEAM], (4) DECIDE option (e) fork best-of-N,
              (5) distill tools not only rules -> .loop/tools/ + ~/.claude/crank/tools/
              [handoff], (6) readback gains a verification clause [DECOMPOSE].

PANEL (round 2): Theo: take the mechanical cheap ones (baseline, frozen eval, script gate);
reject state-file duplicates (MemoryBank hierarchy, SpecKit constitution), BRIEF/COMPASS own
those slots. Lars: strongest-evidenced delta is verifier-drives-the-artifact (Anthropic v1
e2e-as-user + v2 Playwright skeptic + SWE-agent/OpenHands convergence); promotes the
blank-engine rule into Crank law. Mythos: steal the two asymmetries: memory should hold
executable competence not only prose (Voyager/AWM), and stuck lineages should branch not
iterate (LATS/DGM small-N kernel); reject Karpathy's never-stop directive, it is the failure
the gates exist to prevent. Claudus: sprint contract folds into the readback for one clause.

BET-WEIGHTS (round 2):
| Delta | Bet | Verdict |
|---|---|---|
| Baseline before you improve (Karpathy) | 85% | ACCEPT |
| Frozen eval surface + script gate (Karpathy + Anthropic/Kiro) | 85% | ACCEPT |
| Verifier drives the artifact (Anthropic v1/v2) | 82% | ACCEPT |
| Distill tools, not only rules (Voyager/AWM) | 80% | ACCEPT |
| DECIDE (e) fork best-of-N (LATS/DGM kernel) | 72% | ACCEPT, cost-caveated |
| Readback verification clause (Anthropic v2 sprint contract) | 65% | ACCEPT, one clause |
| Never-stop directive (Karpathy) | 5% | REJECT |
| Single-scalar fitness | 15% | REJECT |
| Full MCTS / population evolution | 10% | REJECT (small-N kernel taken) |
| MemoryBank 6-file hierarchy / SpecKit constitution | 20% | REJECT (duplicate state drifts) |
| EARS notation | 15% | REJECT (binary criteria same job) |
| Backpressure asymmetry as skill text (Ralph) | 35% | REJECT (Workflow doctrine owns it) |

ASSUMPTIONS:  benchmark table kept to one row per approach (the research agents' full raw
              returns live in the session, not the repo); Fortune/X secondary coverage of
              autoresearch marked UNVERIFIED in the capture and excluded from claims.
VERDICT:      verifier #2 (fresh, no context from #1): C14 PASS (all 6 deltas diff-traceable
              to named verified sources; bets recorded for accepted AND rejected), C7 PASS
              (0 em dashes, register holds), C8 PASS (byte-identical), C13 PARTIAL (6 of 23
              approaches unmapped; spot-checked sources all real). 5 defects: false
              UNVERIFIED claim in this LOG entry (mark never written into the capture);
              6 unmapped approaches; baseline rule pointed at a LOG slot that did not exist;
              escalation-ladder attribution missing its best-practices URL; "never pause"
              quoted loosely.
DECIDE:       appended below.

DECIDE (round 2, final): all 5 defects fixed: UNVERIFIED block now actually written into the
benchmark capture (the LOG claim is true AFTER the fix; verifier #2 caught me writing the
claim from intention, the exact failure the global write-from-the-diff LEARNINGS rule names);
all 6 unmapped approaches (ClineFlow, BMAD, Task Master, Self-Refine, DSPy, GEPA) mapped in
the covered-before section; BASELINE field added to the Round 0 LOG template; best-practices
URL added to the v2 row; "never pause" replaced with the program.md-sourced phrasing.
C13 upgraded per-approach coverage 23/23. Dogfood: mechanical gate distilled to
.loop/tools/check.sh per the new tools doctrine. STOP: budget round 2 of 2 extension used,
verifier verdicts recorded, ship: commit + push + /html before/after page.
