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
- Name every new rule with a greppable phrase in the skill text itself, AND keep that phrase on one
  line. Run 3's layered fan-in described the mechanism without naming it; run 4 merged a rule whose
  bold name then wrapped across a line break and the gate failed on it immediately (verified run 4,
  `FAIL missing: Retire rules into tools` with the phrase visibly present in the file).
- The skill's own doctrine is the best lens on the skill. Run 4 absorbed almost nothing from a new
  source's mechanisms (16 of ~30 were already present under other names) and its entire value was
  as a lens: pointed at Crank's own memory it exposed a 738-line, 69,859-byte global LEARNINGS file
  violating the skill's own "readable in under a minute" rule. When a new source arrives, audit
  Crank against it before adopting from it (verified run 4).
- The skill's own `research/` folder is the citation of record. A rule with no traceable source in
  there fails the run's own criteria (verified: run 3 verifier 1 failed C13 for exactly this).
