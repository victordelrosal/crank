# Stop Telling the Agent What to Do (Uriostegui) + ClineFlow

Source: https://uriostegui.medium.com/stop-telling-the-agent-what-to-do-8f320a533359
Repo:   https://github.com/hassanvfx/clineflow (cloned and read 2026-07-04)
Author: Hassan Uriostegui. Captured for the Crank canon 2026-07-04, the seventh capture in research/.

## The article's argument

Effective agent-directed work requires shared understanding BEFORE implementation, not
commands upfront. "The most expensive bugs often do not come from syntax. They come from
shared misunderstanding."

The seven-step sequence:
1. Locate: ask the agent to find the relevant call sites ("find the tab bar feed, locate all
   the hot paths").
2. Understand: have the agent explain how the component actually works ("explain in detail,
   using ASCII art diagrams, how this component operates").
3. Introspect: pause and check whether the agent is looking at the right files and whether
   your own mental model still holds.
4. Plan: introduce objectives only after alignment is established.
5. Define success: "what does success look like?" before any implementation.
6. Ground: "before acting on the plan, check every call site and ground every implementation
   change we have planned."
7. Execute: implement only after all prior steps confirm alignment.

## ClineFlow (the repo)

A workflow system for Cline centred on persistent journaling:
- Per-feature journals at docs/journals/[feature].md with a fixed template: phase checkboxes,
  timestamped entries (achievement, implementation details, why this approach, testing, next
  steps, status), known issues, quick reference.
- Journals are the context-window continuation contract: at ~70% context, summarize state
  into the journal and start a new task that references it.
- A documentation hierarchy: feature specs, implementation journals, issue deep-dives.
- Plus Cline-specific SOPs: 300-500 LOC file caps, emoji scanning style, intelligent-commit
  workflow, heredoc commits, feature-branch discipline, VERSION/CHANGELOG management, a
  symlink reference system for sibling repos.

## What Crank took (2026-07-04 round, panel: Theo, Lars, Mythos, Claudus)

1. Ground before you frame (ORIENT): for work on existing systems, locate the real artifacts
   and write an explain-back marked VERIFIED vs ASSUMED before criteria freeze at FRAME.
   Crank's frozen-criteria rule makes an ungrounded mental model uniquely expensive.
2. Ground the plan before building (EXECUTE): each workstream checks its plan against the
   artifacts it will touch; mismatches go to the assumption ledger before the build starts.
   This is the article's step 6 made autonomous.
3. The director's log specified as LOG.md with a fixed per-round entry shape (ClineFlow's
   journal adapted to one file per run). Fixes an internal inconsistency: Crank's resume
   contract cited a "director's log" no section defined.
4. Builder readback (DECOMPOSE): every fleet report opens with three lines: understanding,
   approach, assumptions. Director-to-builder alignment, the article's insight applied inside
   the fleet.
5. Anti-pattern added: optimizing a misunderstood contract.

## What Crank deliberately rejected

- The human-verification ceremony itself: Crank removed the human from the loop on purpose;
  reality (the artifacts) plays the verifier role instead. Import the mechanics, not the
  ceremony.
- File-size caps, emoji style guide, commit/branch/versioning SOPs: Cline-specific baggage;
  COMPASS and the harness already own that ground.
- Per-feature journal hierarchy and symlink reference system: Crank runs are per-mission,
  one LOG.md suffices; the harness reads sibling repos natively.
