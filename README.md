```
 ██████ ██████   █████  ██   ██ ██   ██
██      ██   ██ ██   ██ ███  ██ ██  ██
██      ██████  ███████ ██ █ ██ ████
██      ██  ██  ██   ██ ██  ███ ██  ██
 ██████ ██   ██ ██   ██ ██   ██ ██   ██

           turn the crank. the loop runs.
```

# Crank

**A Claude Code skill for designing loops that prompt the agent, instead of being the loop yourself. You turn the crank once; it runs the loop, checks its own work, and stops before anything it cannot take back.**

Maintained by [Victor del Rosal](https://github.com/victordelrosal). Built and dogfooded with Claude Code; designed for Mythos-class models (Fable 5) and works on Opus 4.8, where the frame does more of the lifting.

---

## Why this exists

For two years the way you got something out of a coding agent was simple: write a prompt, read what came back, write the next prompt. You were the loop. You were the `while` condition, the evaluator, and the retry logic, all running in your head. The quality ceiling was how many times you were willing to hit enter that night.

In June 2026 that idea got a name and a 2-million-view argument. Peter Steinberger put it as "you shouldn't be prompting coding agents anymore, you should be designing loops that prompt your agents." Boris Cherny, who created Claude Code, said the same thing from the other side: "I don't prompt Claude anymore. I have loops running that prompt Claude." Addy Osmani called it "loop engineering." The timeline spent a week arguing about what the word "loop" even meant.

The honest read of that week: the loudest idea in AI coding was one most people repeating it could not define or demonstrate. Crank is my attempt to actually define it and ship it, as a working skill, with the things the hype keeps skipping: a verifier that is harder to fool than the builder, a stopping discipline that keeps an unattended loop from running off a cliff, and a memory file that means run N+1 starts smarter than run N.

It is not new magic and it is not just a cron job. It is a loop with a decision-maker in the body and a frame around it so the decision does not run off a cliff.

---

## What a loop actually is

Strip the mystique and any agent loop is four parts:

1. **Generator**: produces the next prompt (a template, a task list, or a mutation of the last attempt).
2. **Agent run**: the model call that does the work.
3. **Evaluator**: a binary or scored check on the output. No eval is not a loop, it is a fancy `for`.
4. **Controller**: reads the eval and decides: stop, retry, escalate, fan out, or mutate.

The prompt is the cheap part now. The art is almost entirely in parts 3 and 4. **A loop with a weak evaluator fails confidently a thousand times and bills you for it.** That single sentence is the whole skill.

---

## The two modes

Crank ships as one skill, `/crank` (with `/diy-loop` as a legacy alias), with two ways to run it.

### Interactive mode (default)

You hand over the wheel: "you decide what good looks like, direct the fleet, prompt yourself instead of me prompting you, come back when it is 10x what I would have asked for." You are present between rounds. A gate (anything irreversible or outward-facing) pauses the loop in-session and waits for you.

The cycle each round: **ORIENT → FRAME → DECOMPOSE → EXECUTE → RED-TEAM → DECIDE.**

- **ORIENT** grounds before anything is decided. If the work touches an existing system, the loop locates the real artifacts and writes an explain-back of how the thing actually works, marking every load-bearing claim VERIFIED (it looked) or ASSUMED (it inferred), into the run journal (`LOG.md`) before the contract freezes. Improvement-shaped missions also record a measured baseline first, so "better" is provable, not remembered.
- **FRAME** writes the contract before spending tokens: a `BRIEF.md`, 5 to 10 *binary* acceptance criteria, the 10x definition, the anti-criteria (what would make it slop even if it looked done), and a round budget.
- **DECOMPOSE** dispatches a fleet, one specialist per independent workstream.
- **RED-TEAM** is the honesty gate. By default it is a *cold, separate agent* that sees the criteria and the artifacts but not the builder's reasoning, and is told to fail the work. The author grading its own homework is not verification. The verifier's verdict gates the stop: the loop cannot declare done while any criterion fails, and a fresh verifier is spawned each round so it never starts grading its own consistency. Mechanical checks run as scripts that gate the round *before* the verifier is spawned, the evaluation surface (criteria, check scripts, verifier instructions) is frozen so a fix can never quietly edit the test instead of the work, and for anything runnable the verifier drives the artifact like a user and grades the observed behavior, never just the source.
- **DECIDE** investigates *why* a criterion failed before iterating on it, then loops with a specific improvement hypothesis, classified as structural (change the approach) or scalar (turn a knob). Far from passing, it prefers the structural bet, and gives a structural bet that regresses one round of follow-through before reverting. When a criterion has resisted two rounds of single-path iteration, it forks the bet: two or three parallel candidates with different angles, and the fresh verifier picks the winner. Or it downgrades a criterion honestly and says so.

### Scheduled Mode (`/crank scheduled ...`)

The same loop with the human pulled out of the room. Launched by a scheduler or cron, it runs while you are away and has to survive a closed laptop and a cold context. This is the difference between a loop you *kick off* and a loop that is *running*. Three things become mandatory the moment no one is watching:

1. **The human gate becomes an async approval queue.** Nothing irreversible or outward-facing happens without you. Unattended, the loop cannot pause and wait, so it *parks* the gated action in `PENDING-APPROVALS.md`, pings you out of band, and keeps doing every safe workstream that does not depend on it. It never lowers a gate because no one is around to hold it.
2. **A hard budget ceiling that aborts.** Not headroom that asks nicely. An absolute token or dollar ceiling set before the first agent runs and enforced. This is the answer to the "billing surprise orders of magnitude over budget" everyone in production is scared of.
3. **Durable, machine-readable state (`STATE.json`).** Rewritten every round: round number, each criterion's pass/fail status, spend so far, the pending-gates queue, and the single next action. A cron-fired cold start reads it first and resumes from the last decision.

> Scheduling and durability ship together or not at all. A loop that wakes on a timer without crash-safe state and an enforced ceiling is how an unattended run burns a budget and loses its place at the same time.

**Status:** scheduled mode is new and not yet hardened across many real unattended runs. Crank does not ship its own scheduler; the heartbeat comes from Claude Code's own `/schedule`, `/loop`, or cron, which invokes `/crank scheduled ...` on your cadence. Start with a low ceiling and a small, reversible task, and watch the approvals queue before trusting it with anything expensive or long-running.

---

## The three things the hype skips

**Verification is the moat, not the loop.** Everyone is selling the loop. The loop is plumbing. The defensible part is the verifier: a separate adversary, with context isolation, that is trying to fail the work, run *before* the result reaches you. Self-verification is the author being too nice grading its own homework. This is no longer just my position: Anthropic's published loop experiments (Lance Martin, June 2026) found a verifier subagent outperforms self-critique because grading happens in an independent context window, and their hosted Outcomes feature gates stopping on a separate grader, which is exactly the shape Crank ships. The capture is in [`research/`](research/).

**Memory is the outer loop.** A single run loops until the verifier passes; `LEARNINGS.md` loops across runs, and it holds tools, not only lessons: a reusable check script or verifier prompt built mid-run gets promoted to a tools folder at handoff, so the next run starts from competence instead of re-deriving it. The progression is fail, investigate, verify, distill, consult: a failure gets diagnosed before it gets retried, the diagnosis gets verified, the verified fact gets distilled into a general rule at handoff, and the next run reads the rules at orientation instead of re-deriving them. Only verified rules earn a line; a pile of failure notes and open guesses is the failure mode, not memory. This is the part of the loops discourse almost nobody is shipping.

**It is designed not to deskill its operator.** Every run ends with a mandatory DIY Addendum: a short, honest note headed *"What you'd need to do this yourself"* that names the specific skills, tools, and judgement the loop just bundled. The faster a loop ships code you did not write, the bigger the gap between what exists and what you actually understand. That gap is comprehension debt, and a smooth loop grows it faster. The Addendum keeps the capability transfer honest, so the loop never quietly leaves you more served and less able.

---

## Crank cranked Crank (the 2026-07-04 self-upgrade)

On 4 July 2026 the loop was pointed at itself, twice in one morning, and the upgrade shipped
only because two fresh hostile verifiers passed it. The full run record is public in this
repo: the contract and journal in [`.loop/`](.loop/), the source captures in
[`research/`](research/).

**Round 1** absorbed Hassan Uriostegui's "Stop telling the agent what to do" and his
[ClineFlow](https://github.com/hassanvfx/clineflow) repo. His argument: the expensive bugs
come from shared misunderstanding, not syntax, so build shared understanding before
implementation. Crank has no human in the loop to align with, so the translation is that
reality plays the human's part: ground-before-frame at ORIENT, plan-grounding before any
build, a three-line builder readback, the run journal formally specified as `LOG.md`
(round 1 caught Crank's own manual citing a "director's log" that no section defined), and a
new anti-pattern: optimizing a misunderstood contract.

**Round 2** benchmarked Crank against 23 approaches, every source fetched and verified:
[Karpathy's autoresearch](https://github.com/karpathy/autoresearch), the Ralph loop, Cline
Memory Bank, GitHub Spec Kit, AWS Kiro, BMAD, Task Master, both Anthropic long-running-agent
harness posts, and the academic line (Reflexion, LATS, Voyager, Self-Refine, SWE-agent,
OpenHands, DSPy, GEPA, Darwin Godel Machine, AI Scientist, AlphaEvolve, STOP, AWM). The
honest headline: Crank already carried most of the field's load-bearing mechanisms. Six new
ones cleared the panel: baseline-before-you-improve (Karpathy), scripts as a blocking gate
plus the frozen evaluation surface (Karpathy's immutable eval, Anthropic's untouchable
tests, Kiro's deterministic hooks), the verifier drives the artifact (Anthropic v1/v2),
distill tools not only rules (Voyager, AWM), fork-the-bet best-of-N when iteration is stuck
(the transferable kernel of LATS and DGM), and a verification clause in the builder readback
(Anthropic's sprint contract). The full covers-vs-lacks mapping and the rejections, including
Karpathy's never-stop directive, are in
[`research/loop-benchmark-2026-07.md`](research/loop-benchmark-2026-07.md).

Two details worth the click. The run found this repo's skill copy three weeks behind the
installed one and repaired the drift. And the second verifier caught the loop recording a fix
it had not yet written; the catch, and the correction, are in
[`.loop/LOG.md`](.loop/LOG.md) verbatim. That is the design working: a check the loop cannot
talk its way past, even when the work being checked is its own upgrade.

---

## The lineage (so we stop talking past each other)

This is not year zero. The honest ladder, oldest to newest:

- **ReAct (2022)** formalized reason, act, observe, repeat. One model, one loop, a human watching.
- **AutoGPT (2023)** gave it a goal and let it prompt itself, and became famous for spinning forever doing nothing.
- **The ralph loop (Geoffrey Huntley, 2025)** piped the same prompt file into the agent over and over; its real innovation was resetting context to fixed anchor files each iteration.
- **`/goal` and `/loop` (2026)** productized the ralph loop until a validator confirms done.
- **autoresearch (Karpathy, 2026)** pointed the loop at model training: mutate, run under a fixed budget, keep only what beats the metric, with the eval frozen so the loop cannot cheat it.
- **Orchestration loops (now)** where loops supervise other loops, on a schedule, with durable state.

Crank is the closed-loop, budget-disciplined member of that family. "Closed" in the sense Shann Holmberg drew: a human designs the path, every step has an eval, and there is a defined point where it stops or hands back. Open-ended exploratory loops are exciting and they are a slop machine on a real budget. Crank is built to run on a normal budget and still be trustworthy.

---

## Install

Crank is a Claude Code skill.

```bash
git clone https://github.com/victordelrosal/crank.git
mkdir -p ~/.claude/skills/crank
cp crank/skill/SKILL.md ~/.claude/skills/crank/SKILL.md
```

Then in any Claude Code session:

```
/crank turn this research report into a publishable pitch package, make me proud
```

or, to run it unattended on a heartbeat:

```
/crank scheduled babysit my open PRs overnight; auto-fix build breaks, queue anything that needs my call
```

Upgrading from an earlier install at `~/.claude/skills/diy-loop/`? Either delete that folder, or leave a one-line alias SKILL.md in it pointing at `crank` so `/diy-loop` keeps working.

### Companion pieces

Crank sits on top of two smaller habits it expects to exist:

- **`/diy`**: locks the agent into autonomous execution with no clarifying questions back to you. Without it, the director starts asking questions mid-loop and defeats the point.
- **`/bet-weights`**: the per-round confidence check ("would you bet your weights on this being right?"). It is the calibration framing that stops the director marking its own work soft.

The chain is: `/diy` (no questions) → `/crank` (self-set criteria + loop + gates) → `/bet-weights` (per-round confidence report; the cold verifier is the judge).

See [`docs/index.html`](docs/index.html) for a visual side-by-side of the two modes, and [`research/`](research/) for the source material from the June 2026 loops discourse.

---

## Where it stops

You are free to decide what to build and how. You are not free to cause irreversible external effects without a human. Before spending money, touching real clients or production, publishing publicly, or deleting anything not trivially recoverable, the loop stops and asks (interactive) or parks and pings (scheduled). The gate is about irreversibility and reach, not permission to think.

---

## License

MIT. See [LICENSE](LICENSE). Use it, fork it, improve it. If it saves you from being the loop, tell me what you built.
