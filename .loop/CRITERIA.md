# CRITERIA: Crank run 4 (2026-07-27, evening)

Binary. Frozen at FRAME. The cold verifier's verdict is the gate.
Anchor named per criterion. Env = environment-checkable, Judge = judge-checkable.

## C1 (Env) The source is captured
`research/knowledge-graph-playbook-anthropic-2026-07.pdf` exists in the repo and
`~/Downloads/The-Knowledge-Graph-Playbook-Anthropic.pdf` does not exist.
ANCHOR: `ls` both paths.

## C2 (Env) The naming collision is named in the skill
`skill/SKILL.md` contains a passage that explicitly states the two live meanings of "graph"
(topology vs shared memory) and says which one Crank's DECOMPOSE section means. Greppable by a
fixed phrase added to `.loop/tools/check.sh`.
ANCHOR: `bash .loop/tools/check.sh` passes with the new grep term present.

## C3 (Judge) Covers-vs-lacks is complete and honest
The research capture contains a covers/lacks table scoring EVERY substantive mechanism in the
playbook (minimum 12 rows) against Crank's actual current text, each row marked Covered /
Partly / Lacked, and each "Covered" row naming the Crank rule that covers it by its greppable
name. RUBRIC: a cold reader with SKILL.md open can verify any row in under a minute.

## C4 (Judge) Every adopted delta is a real gap, not a restatement
No delta added to SKILL.md restates a rule already present under another name. RUBRIC: for each
delta, the capture names what was searched for and found absent.

## C5 (Env) Nothing rests on an unverified figure, and the source is attributed as secondary
The research capture states up front that the playbook is an independent synthesis not affiliated
with or endorsed by Anthropic, and no numeric claim from it (precision 1.00, recall 0.38 to 0.55,
k=2 / 200 triples) appears in `skill/SKILL.md` at all.
ANCHOR: `grep -c` for those figures in SKILL.md returns 0.

## C6 (Judge) The "do we need a knowledge graph" question is answered with an argument
The run states plainly whether Crank should build or adopt a knowledge-graph memory layer, and
argues it from the playbook's OWN decision framework plus Crank's actual scale, rather than
asserting a preference. A reader who disagrees can see exactly which premise to attack.

## C7 (Env) The live memory failure is fixed, not just noted
`~/.claude/crank/LEARNINGS.md` was measured at 738 lines / 69,859 bytes / 179 rules this run,
against the skill's own rule that the file be "readable in under a minute". At the end of the
run the global memory is restructured so that a fresh run can consult it without reading 70KB,
AND the skill states the mechanism that keeps it bounded.
ANCHOR: the restructured artifact exists at a named path and the entry file is under 200 lines;
no rule text is deleted without being relocated (byte accounting shown).

## C8 (Env) Read/write separation on memory is stated
`skill/SKILL.md` states that the cold verifier reads the memory and state files but never writes
them, and names the failure it prevents.
ANCHOR: grep term in check.sh.

## C9 (Env) The mechanical gate covers every new rule
`.loop/tools/check.sh` has one grep term per rule added this round, and `bash .loop/tools/check.sh`
prints GATE PASS.
ANCHOR: run it.

## C10 (Env) The public README carries the distinction
`README.md` states the two meanings of "graph" and does not leave the July 27 topology section
reading as the only meaning.
ANCHOR: grep README.md.

## C11 (Env) Style law holds and the installed skill is in sync
Zero em dashes in every authored file, and `~/.claude/skills/crank/SKILL.md` is byte-identical to
`skill/SKILL.md`.
ANCHOR: `bash .loop/tools/check.sh` (it already asserts both).

## C12 (Judge) The skill did not get fatter than it got better
Net line growth of `skill/SKILL.md` this round is under 60 lines, OR any growth beyond that is
offset by text pruned in the same round with the pruning named. RUBRIC: a reader comparing
before/after agrees each added line earns its place.
ANCHOR: `git diff --stat` on skill/SKILL.md.
