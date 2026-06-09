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

Maintained by [Victor del Rosal](https://github.com/victordelrosal). Built and dogfooded with Claude Code (Opus).

---

## Why this exists

For two years the way you got something out of a coding agent was simple: write a prompt, read what came back, write the next prompt. You were the loop. You were the `while` condition, the evaluator, and the retry logic, all running in your head. The quality ceiling was how many times you were willing to hit enter that night.

In June 2026 that idea got a name and a 2-million-view argument. Peter Steinberger put it as "you shouldn't be prompting coding agents anymore, you should be designing loops that prompt your agents." Boris Cherny, who created Claude Code, said the same thing from the other side: "I don't prompt Claude anymore. I have loops running that prompt Claude." Addy Osmani called it "loop engineering." The timeline spent a week arguing about what the word "loop" even meant.

The honest read of that week: the loudest idea in AI coding was one most people repeating it could not define or demonstrate. Crank is my attempt to actually define it and ship it, as a working skill, with the two things the hype keeps skipping: a verifier that is harder to fool than the builder, and a stopping discipline that keeps an unattended loop from running off a cliff.

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

Crank ships as one skill, `/diy-loop`, with two ways to run it.

### Interactive mode (default)

You hand over the wheel: "you decide what good looks like, direct the fleet, prompt yourself instead of me prompting you, come back when it is 10x what I would have asked for." You are present between rounds. A gate (anything irreversible or outward-facing) pauses the loop in-session and waits for you.

The cycle each round: **ORIENT → FRAME → DECOMPOSE → EXECUTE → RED-TEAM → DECIDE.**

- **FRAME** writes the contract before spending tokens: a `BRIEF.md`, 5 to 10 *binary* acceptance criteria, the 10x definition, the anti-criteria (what would make it slop even if it looked done), and a round budget.
- **DECOMPOSE** dispatches a fleet, one specialist per independent workstream.
- **RED-TEAM** is the honesty gate. By default it is a *cold, separate agent* that sees the criteria and the artifacts but not the builder's reasoning, and is told to fail the work. The author grading its own homework is not verification.
- **DECIDE** runs a confidence check on every criterion (would you bet on it passing real human review?) and either stops, loops with a specific improvement hypothesis, or downgrades a criterion honestly and says so.

### Scheduled Mode (`/diy-loop scheduled ...`)

The same loop with the human pulled out of the room. Launched by a scheduler or cron, it runs while you are away and has to survive a closed laptop and a cold context. This is the difference between a loop you *kick off* and a loop that is *running*. Three things become mandatory the moment no one is watching:

1. **The human gate becomes an async approval queue.** Nothing irreversible or outward-facing happens without you. Unattended, the loop cannot pause and wait, so it *parks* the gated action in `PENDING-APPROVALS.md`, pings you out of band, and keeps doing every safe workstream that does not depend on it. It never lowers a gate because no one is around to hold it.
2. **A hard budget ceiling that aborts.** Not headroom that asks nicely. An absolute token or dollar ceiling set before the first agent runs and enforced. This is the answer to the "billing surprise orders of magnitude over budget" everyone in production is scared of.
3. **Durable, machine-readable state (`STATE.json`).** Rewritten every round: round number, each criterion's pass/fail status, spend so far, the pending-gates queue, and the single next action. A cron-fired cold start reads it first and resumes from the last decision.

> Scheduling and durability ship together or not at all. A loop that wakes on a timer without crash-safe state and an enforced ceiling is how an unattended run burns a budget and loses its place at the same time.

**Status:** scheduled mode is new and not yet hardened across many real unattended runs. Crank does not ship its own scheduler; the heartbeat comes from Claude Code's own `/schedule`, `/loop`, or cron, which invokes `/diy-loop scheduled ...` on your cadence. Start with a low ceiling and a small, reversible task, and watch the approvals queue before trusting it with anything expensive or long-running.

---

## The two things the hype skips

**Verification is the moat, not the loop.** Everyone is selling the loop. The loop is plumbing. The defensible part is the verifier: a separate adversary, with context isolation, that is trying to fail the work, run *before* the result reaches you. Self-verification is the author being too nice grading its own homework.

**It is designed not to deskill its operator.** Every run ends with a mandatory DIY Addendum: a short, honest note headed *"What you'd need to do this yourself"* that names the specific skills, tools, and judgement the loop just bundled. The faster a loop ships code you did not write, the bigger the gap between what exists and what you actually understand. That gap is comprehension debt, and a smooth loop grows it faster. The Addendum keeps the capability transfer honest, so the loop never quietly leaves you more served and less able.

---

## The lineage (so we stop talking past each other)

This is not year zero. The honest ladder, oldest to newest:

- **ReAct (2022)** formalized reason, act, observe, repeat. One model, one loop, a human watching.
- **AutoGPT (2023)** gave it a goal and let it prompt itself, and became famous for spinning forever doing nothing.
- **The ralph loop (Geoffrey Huntley, 2025)** piped the same prompt file into the agent over and over; its real innovation was resetting context to fixed anchor files each iteration.
- **`/goal` and `/loop` (2026)** productized the ralph loop until a validator confirms done.
- **Orchestration loops (now)** where loops supervise other loops, on a schedule, with durable state.

Crank is the closed-loop, budget-disciplined member of that family. "Closed" in the sense Shann Holmberg drew: a human designs the path, every step has an eval, and there is a defined point where it stops or hands back. Open-ended exploratory loops are exciting and they are a slop machine on a real budget. Crank is built to run on a normal budget and still be trustworthy.

---

## Install

Crank is a Claude Code skill.

```bash
git clone https://github.com/victordelrosal/crank.git
mkdir -p ~/.claude/skills/diy-loop
cp crank/skill/SKILL.md ~/.claude/skills/diy-loop/SKILL.md
```

Then in any Claude Code session:

```
/diy-loop turn this research report into a publishable pitch package, make me proud
```

or, to run it unattended on a heartbeat:

```
/diy-loop scheduled babysit my open PRs overnight; auto-fix build breaks, queue anything that needs my call
```

### Companion pieces

Crank sits on top of two smaller habits it expects to exist:

- **`/diy`**: locks the agent into autonomous execution with no clarifying questions back to you. Without it, the director starts asking questions mid-loop and defeats the point.
- **`/bet-weights`**: the per-round confidence check ("would you bet your weights on this being right?"). It is the calibration framing that stops the director marking its own work soft.

The chain is: `/diy` (no questions) → `/diy-loop` (self-set criteria + loop + gates) → `/bet-weights` (per-round honest judge).

See [`docs/index.html`](docs/index.html) for a visual side-by-side of the two modes, and [`research/`](research/) for the source material from the June 2026 loops discourse.

---

## Where it stops

You are free to decide what to build and how. You are not free to cause irreversible external effects without a human. Before spending money, touching real clients or production, publishing publicly, or deleting anything not trivially recoverable, the loop stops and asks (interactive) or parks and pings (scheduled). The gate is about irreversibility and reach, not permission to think.

---

## License

MIT. See [LICENSE](LICENSE). Use it, fork it, improve it. If it saves you from being the loop, tell me what you built.
