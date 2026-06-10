# Loop engineering: the 14-step roadmap (Codez / @0xCodez, X thread, 9 Jun 2026)

Source: X thread by @0xCodez, "Loop engineering: the 14-step roadmap from prompter to loop
designer." 310K views. Captured 2026-06-10 (PDF in crank/ root).

## What it is

A downstream synthesis, not new research. It explicitly sources from Anthropic's engineering
docs, Addy Osmani's long-form on loop engineering, AlphaSignal's analysis, and Geoffrey
Huntley's "Ralph Wiggum" failure mode. All four are sources Crank had already metabolized, so
~12 of the 14 steps were already encoded. Three tiers: (1) decide if you need a loop at all,
(2) the five building blocks, (3) build the smallest loop that works.

## Mapping to Crank (already covered)

- Maker/checker split (step 9) = RED-TEAM cold verifier.
- State file + VISION reread (steps 10, 12) = STATE.json + BRIEF reread on resume.
- Hard stops + Ralph Wiggum quiet-failure (steps 11-12) = three independent hard stops +
  verifier-gates-the-stop.
- Skills / worktrees / automations (steps 5-7) = DECOMPOSE + scheduled mode.
- Goal drift / agentic laziness (step 12) = scope-drift anti-pattern + assumption ledger.

## What it added (deltas applied 2026-06-10)

1. **Should this even BE a loop? (steps 2-4).** The thread's honest core: most work does not
   need a loop; one-off and judgment-call work loses. Folded into the FRAME loop-fitness check:
   if a task is both one-off AND almost entirely judgment-checkable, conclude it is not
   loop-shaped and offer one well-aimed pass + single red-team instead.
2. **The security tax (step 14).** An unattended loop is an unattended attack surface. Added as
   point 4 of scheduled mode: security check in the gate (secret scan + dep audit + SAST), audit
   skill/connector sources before use, sanitize logs, least-privilege re-audited at handoff.

## What it offered that was deliberately NOT taken

- **"Cost per accepted change" / <50% accepted-rate = loop losing (step 11).** Borrowed from a
  CI-loop context with many discrete machine-checkable changes. Crank's work is often one-off
  creative (a Netflix pitch has no "accepted-change rate"). Importing it would be cargo-culting.
  Rejected at ~35% bet-weights confidence.
