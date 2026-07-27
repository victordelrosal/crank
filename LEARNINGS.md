# Crank workspace LEARNINGS (project truths for the crank repo itself)

Verified rules only; prune on write. Craft rules that apply everywhere live in
`~/.claude/crank/LEARNINGS.md`. Created 2026-07-27 (run 3).

- `WHISPER.md` in this repo is founder's-eyes-only and must NEVER reach the public remote. It is
  now in `.gitignore`; never re-add it, and never stage this repo with `git add -A` (verified: run
  3 staged it toward github.com/victordelrosal/crank and a cold verifier caught it before push;
  the instruction is in `log/handoff-2026-07-04-2118.md` line 17). `SENTENCE.md` and `design/` are
  publishable but stay untracked unless Victor asks.
- The public page at victordelrosal.com/crank/ is served from the `victordelrosal.github.io` repo
  at `crank/index.html`, NOT this repo's `docs/index.html`, which is dark. The local Dropbox clone
  of that repo runs far behind `origin/main` (159 commits and 366 page lines behind at run 3,
  because a "Build Wave Pages" bot commits to it). Always edit in a worktree checked out at
  `origin/main` and push `HEAD:main` as a fast-forward (verified run 3).
- `.loop/tools/check.sh` is the blocking mechanical gate: em-dash law over authored files, installed
  vs repo skill sync, and a grep per named rule. Every rule added to SKILL.md must be added to that
  grep list in the same round, or a future run can silently drop it (verified run 3, 9 names added).
- Name every new rule with a greppable phrase in the skill text itself. Run 3's layered fan-in
  described the mechanism without naming it and the gate could not see it until it was renamed.
- The skill's own `research/` folder is the citation of record. A rule with no traceable source in
  there fails the run's own criteria (verified: run 3 verifier 1 failed C13 for exactly this).
