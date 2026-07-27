# Director's log: Crank run 4 (2026-07-27, evening)

## Round 0 (2026-07-27 21:00)

GROUNDING (explain-back of the system this run modifies):
- VERIFIED: `skill/SKILL.md` is 776 lines and is byte-identical to `~/.claude/skills/crank/SKILL.md`
  (`cmp` via `.loop/tools/check.sh`). Editing the repo copy alone would ship nothing; the sync is a
  gate assertion, not a convention.
- VERIFIED: `.loop/tools/check.sh` is the blocking mechanical gate: an em-dash sweep over a named
  AUTHORED set, the installed-vs-repo sync assert, and one grep per named rule. A rule added to
  SKILL.md without a grep term here is invisible to the gate and can be silently dropped later
  (this is a workspace LEARNINGS rule from run 3).
- VERIFIED: run 3 closed 19 hours earlier (commits 3a27a02, b9f7e3b) having absorbed eleven
  TOPOLOGY deltas and having explicitly REFUSED "graph engineering as a third Crank mode".
- VERIFIED: `~/.claude/crank/LEARNINGS.md` measured 738 lines, 69,859 bytes, 179 rules (`wc`,
  `grep -c '^- '`), which is 1.24x the byte size of SKILL.md itself, against the skill's own rule
  that the file stay "readable in under a minute". It truncated when read into this session's
  context (20,003 characters dropped).
- VERIFIED: `~/.claude/crank/tools/` did not exist, though SKILL.md has promised craft-grade tools
  there since 2026-07-04.
- ASSUMED (stated, not checked): the imported PDF is the complete document, 12 pages, no withheld
  appendix.

BASELINE (improvement-shaped mission, recorded before any change):
skill/SKILL.md 776 lines / 56,473 bytes. Global craft memory 738 lines / 69,859 bytes / 179 rules,
flat, chronologically ordered, no retrieval move, no gate. `.loop/tools/check.sh` carrying 16 rule
greps. `research/` holding 9 captures.

## Round 1 (2026-07-27 21:00 to 21:30)

HYPOTHESIS (structural): the playbook's value to Crank is not its mechanisms, which Crank mostly
already has under other names, but its LENS. Applied as a lens it should expose (a) a term
collision created by run 3 that morning, and (b) whatever Crank's own memory layer is doing wrong.
Predicted outcome: mostly "no changes needed" on mechanisms, plus one or two real structural finds.

DID:
- Imported the PDF to `research/knowledge-graph-playbook-anthropic-2026-07.pdf` (Downloads cleared,
  verified absent).
- Dispatched the panel Victor named, all opus, all read-only, all in one turn (no edges between
  them): THEO (mechanism audit, covers vs lacks), LARS (taxonomy plus sourcing, with web fetch),
  MYTHOS (the memory-layer call plus the fix design).
- Integrated three ADOPTs from Theo, the disambiguation from Lars, and the shard design from
  Mythos. Refused Lars's stricter "absorb no mechanisms at all" on the grounds that D1 to D3 were
  found by grepping Crank's own text, not taken on the document's authority, which is the exact
  distinction his own appraisal draws.
- Wrote 5 edits to `skill/SKILL.md` (net +56 lines), the research capture, the README paragraph,
  6 new grep terms in `.loop/tools/check.sh`, and the memory restructure.
- Memory restructure: verbatim backup, 179 rules migrated into 7 topic shards by keyword, index
  rewritten as ALWAYS-plus-shard-table, `learnings/ARCHIVE.md` created, and
  `~/.claude/crank/tools/learnings-check.sh` written as the new blocking gate.

FAN-IN: 3 dispatched, 3 returned. No gap.

ASSUMPTIONS (gap-filling calls beyond the BRIEF):
- Kept migrated rules VERBATIM rather than truncating them to the 300-character shard line format
  Mythos specified. Truncation would destroy verified content to satisfy a format; the character
  guidance therefore applies to new rules and the gate enforces counts and stamps, not length, on
  migrated ones.
- Split the `loop` bucket into `loop.md` and `verify.md` when the first pass put 68 rules in one
  shard against a 60 cap. A gate that is red on the day it is installed gets ignored, so the debt
  was paid rather than the bar raised.
- Exempted `ARCHIVE-2026-07-27-pre-shard.md` from the em-dash sweep: it is a frozen verbatim
  record, and the style law governs what we write, not what we preserve. Same precedent as the
  repo gate's treatment of raw research captures.
- Rewrote two quoted em dashes in `verify.md:34` as `(U+2014)` rather than deleting them: the rule
  is ABOUT em dashes leaking into headers, so the examples had to survive in describable form.
- Did NOT build `~/.claude/crank/tools/shoot.sh`, though Mythos argued it is the highest-leverage
  move available. Its flags cannot be verified without driving real browsers, which is a second
  mission. Adopted the RULE ("Retire rules into tools") and named the script as the next candidate.

GEAR: drive (opus) throughout. Three panel agents opus, director opus. No sonnet dispatches this
run: nothing in it was mechanical enough. The two gates are shell scripts, no model.

VERDICT: cold verifier (fresh, criteria plus artifacts only, told to fail the work): 11 PASS,
1 PARTIAL. C4 PARTIAL, because "Retire rules into tools" was added as a bullet twenty lines below
the pre-existing "Distill tools, not only rules" and repeated its justifying sentence, and because
two added rules had no covers/lacks row naming an absence search. Verifier independently
re-derived the rule accounting (179 in, 179 out), swept em dashes outside the gate's allowlist,
and confirmed the gate was not weakened (`git diff .loop/tools/check.sh` is +3/-1, all additive).

DECIDE: iterate, scalar, one round. The PARTIAL was correct and the fixes were cheap.

## Round 2 (2026-07-27 21:45)

HYPOTHESIS (scalar): C4 fails on two specific, checkable defects; merging the duplicate bullet and
adding the two missing covers/lacks rows closes both without touching anything else.

DID:
- Merged "Retire rules into tools" INTO the existing "Distill tools, not only rules" bullet,
  deleting the near-verbatim justifying sentence and keeping only the additional instruction
  (convert an existing prose rule into a script, archive it `superseded-by: <tool path>`).
- Added covers/lacks rows D5 and D6 to the capture, each naming the exact grep run and found
  absent.
- Acted on two further verifier defects it raised outside C4: the eviction rule was undecidable
  because all 179 migrated rules carry the identical `[2026-07]` stamp (stated the honest tie-break
  in the index rather than pretending the mechanism works yet), and the 60-rule shard caps were
  defeatable by adding an eighth shard (added a shard-count cap of 8 to `learnings-check.sh`).
- The repo gate then FAILED on `Retire rules into tools`: the bold phrase had wrapped across a line
  break and was no longer greppable, though visibly present. Unwrapped and re-ran. This is run 3's
  own workspace rule catching a run-4 violation of it, which is the gate working.

FAN-IN: 1 dispatched (scoped C4 re-verify), 1 returned. No gap.

ASSUMPTIONS: none new.

GEAR: drive (opus) throughout, including the scoped re-verify.

VERDICT: scoped cold re-verify of C4 (fresh agent, C4 only, ran its own diff and its own greps
against `git show HEAD:skill/SKILL.md`): **C4 PASS**. Both prior defects closed; no pre-existing
rule found saying the same thing under another name for any of the seven added rules. Final tally
**12 of 12 PASS**.

DECIDE: STOP. Every criterion passes on the cold verifier's verdict, both gates are green, and the
round produced no new failure to aim at. Two acknowledged weaknesses remain and are reported rather
than hidden: nothing automatically invokes `learnings-check.sh` (it runs when an agent chooses to),
and `tools/shoot.sh` was named as the highest-leverage next move but not built.
