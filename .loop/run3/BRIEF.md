# BRIEF: Crank improves Crank (Uriostegui/ClineFlow alignment round)
Run date: 2026-07-04. Director: Claudus on Fable 5. Panel: Theo, Lars, Mythos.
(Prior contract: the June launch run; superseded, in git history.)

WHAT:         An improved /crank skill (SKILL.md, installed + repo copies), a research note
              capturing the Uriostegui article + clineflow repo, a before/after HTML page.
WHY:          Victor wants /crank to absorb whatever the "Stop telling the agent what to do"
              approach does better: alignment-before-implementation, grounding, and
              persistent journaling. Same pattern as the 2026-06-09 Lance Martin round:
              new source, extract the delta, execute only the bet-worthy changes.
WHO:          Future Crank runs (every project), and readers of github.com/victordelrosal/crank.
CRITERIA:     see CRITERIA.md (12, mostly environment-checkable; loop-shaped).
PRD:          no. BRIEF + CRITERIA suffice for a skill edit.
FLEET:        director/builder = self (Claudus); panel = Theo + Lars + Mythos (judgment);
              cold verifier = fresh subagent per round, sees CRITERIA + artifacts only.
LOOP BUDGET:  3 rounds max.
EXIT:         Skill updated with panel-approved deltas only, both copies identical, verifier
              passes, pushed to GitHub, before/after HTML delivered.
DOWNGRADES:   C10 (HTML page) may ship after the verifier round rather than inside it, since
              the page describes the final state. None of C1-C9 may be downgraded.

Known repair discovered at ORIENT: installed skill is ahead of repo copy (2026-07-02 edits
never synced to sBs/crank/skill/SKILL.md). Sync is part of this run.

## v2 extension (Victor interjection, 2026-07-04, after round 1 shipped)
Scope extended: benchmark Crank against the wider field (Karpathy autoresearch, Ralph,
Memory Bank, spec-driven harnesses, academic self-improvement loops), then execute the
bet-worthy deltas. Criteria 13-16 appended. Budget: +2 rounds (4 total). Fleet: 3 parallel
research agents (Karpathy/local, practitioner harnesses, academic mechanisms), director
synthesis, panel, builder, fresh cold verifier #2.

## v3 run (2026-07-27): the topology layer

WHAT:         /crank absorbs the harness/loop/graph distinction: a topology-aware DECOMPOSE, an
              anchors rule, a layer diagnostic; plus a research capture, a README section, and a
              new section on the live page at victordelrosal.com/crank/.
WHY:          Victor passed two late-July X articles (beamnxw on the three layers, Kopadze on
              graph mechanics) and asked Crank to process, refine, reflect, then crank itself.
              Same pattern as the 2026-07-04 rounds: new source, extract the delta, execute only
              the bet-worthy changes, publish the record.
WHO:          Future Crank runs everywhere, and readers of github.com/victordelrosal/crank and
              victordelrosal.com/crank/.
CRITERIA:     see CRITERIA.md run-3 block (13, mostly environment-checkable; loop-shaped).
PRD:          no. BRIEF + CRITERIA + DELTA suffice for a doctrine edit.
FLEET:        director/builder = Claudus on Opus 5 (delta spec, research capture, SKILL.md
              surgery, gate, deploy); builder A = opus (README section); builder B = opus (live
              page section, in an isolated worktree); cold verifier = fable, fresh, final round.
EDGES:        builders A and B both wait on .loop/DELTA-2026-07-27.md and on nothing else. No
              edge between them (fake-edge test applied: neither consumes the other's output).
              Hidden-edge audit: A writes README.md only, B writes a worktree index.html only,
              director writes skill/, research/, .loop/. No shared file, no git op by builders.
              Verifier waits on all three.
LOOP BUDGET:  3 rounds max.
EXIT:         Skill carries the eleven adopted deltas and nothing unsourced, both copies
              identical, gate passes, cold verifier passes, both repos pushed, live URL serves
              the new section.
DOWNGRADES:   C13 (verifier's no-ceremony judgment) may land PARTIAL with a written rationale;
              it is the one judge-checkable criterion. C1 to C12 may not be downgraded.
