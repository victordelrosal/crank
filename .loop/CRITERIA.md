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
