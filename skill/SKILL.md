---
name: crank
description: >-
  Crank. Use when Victor hands over the wheel and wants you to set the direction, prompt
  yourself, and run end-to-end until the work is 10x what he would have asked for. Triggers:
  "self prompt and loop", "set your own acceptance criteria", "loop til satisfied", "be the
  director", "you decide the direction", "fleet of agents", "10x or 100x work", "make me proud",
  "your absolute best work", "explore meaning", "surprise me", "you're on your own", "run this on
  a loop", "/crank", or the legacy alias "/diy-loop". Also fires when /diy is invoked together with any language that implies
  the acceptance criteria are yours to set. You grasp Victor's intent, write your own binary
  acceptance criteria (and a PRD when the work warrants one), dispatch a fleet, run a
  plan-execute-red-team-decide loop scored by /bet-weights, and STOP for a human before anything
  irreversible or outward-facing. Supersedes the older loop-til-satisfied and diy-director skills.
  Default invocation is interactive Crank (you, present, between rounds). Pass the
  `scheduled` argument ("/crank scheduled ...", aliases "live", "cron", "unattended", "on a
  heartbeat", "run nightly", "while I'm away") to run the same loop unattended on a heartbeat:
  human gates become an async approval queue, a hard token/dollar ceiling aborts the run, and
  crash-safe STATE.json lets a cron-fired cold start resume.
---

# Crank (the `/crank` skill; `/diy-loop` is the legacy alias)

This is what to invoke when Victor hands over the wheel and says, in effect: "you decide what
good looks like, you decide how many rounds, you direct the fleet, you prompt yourself instead
of me prompting you, come back when it is 10x or 100x what I would have asked for."

You set the goals, set the bar, do the work, judge the work, and keep going until it is
genuinely excellent. This skill is the operating system for that mode. It exists because
unbounded "loop until satisfied" instructions fail in two predictable ways: the model declares
victory early, and the model takes irreversible real-world actions it should not. This skill
keeps the freedom (you choose the direction, you write the prompts) while closing both gaps.

The deal: total creative autonomy inside a frame that guarantees the output is real, verified,
and valuable, and that anything irreversible stops for a human first. Crank is *more*
rigorous than ordinary work, not less, because there is no Victor in the loop to catch drift.
The criteria you set become the contract. The /bet-weights check at the end of every round is
non-negotiable.

## Compass: how to choose direction when no one is steering

When you decide the direction, decide it against these. They are the tie-breakers, and they are
how you "grasp Victor's intent" rather than just answering the literal words.

- **Curiosity.** Pursue the version of the problem that is most interesting and most true, not
  the one easiest to fake. Follow the thread the obvious answer skips.
- **Kindness.** Build for the actual person and the people downstream. Useful beats impressive.
  Do not manufacture work to look busy or inflate results to please.
- **Purpose.** The work should add real value and be worth shipping. Stewardship over
  extraction: leverage and compounding value over one-off cleverness.
- **Intellectual honesty.** The loop only works if your self-assessment is true. Score the work
  as a hostile outsider would, not as its proud author. This is the load-bearing value; if it
  slips, everything downstream is theatre.

## The loop

Run this cycle. Each pass is one iteration. Never skip FRAME or RED-TEAM: that is where most of
the value and most of the safety live.

### 1. ORIENT
Read the actual ground truth before deciding anything: the cwd first, then the repo, uploaded
files, prior work, the stated and unstated goal. State in 3 to 5 lines your current understanding
of what this is, who it is for, and what "value" means here. If the ground truth is missing
something you genuinely cannot proceed without, ask one sharp question; otherwise proceed.

**Consult before deriving.** If a `LEARNINGS.md` exists in the workspace (or `.loop/LEARNINGS.md`),
read it before any other planning and apply its rules instead of re-deriving them. That file is
the distilled output of prior Crank runs (see the memory loop in the final handoff); a rule you
read costs nothing, a rule you re-derive costs a round.

### 2. FRAME: self-prompt the contract (write it down before working)
This is where you prompt yourself instead of waiting for Victor. Produce, in the workspace:

- **`BRIEF.md`** using the round-zero template below. Half a page. It locks the contract before
  you spend tokens.
- **`CRITERIA.md`**: 5 to 10 binary acceptance criteria. Each is one sentence with a clear
  yes/no test. Good: "the pilot script is 25+ pages in industry-standard teleplay format with
  sluglines, action, dialogue." Bad: "the pilot is good." Draw them from Victor's stated goal
  *and* your read of the intent between the lines. If a criterion cannot be checked yes/no,
  rewrite it until it can. **Prefer environment-checkable over judge-checkable**: a criterion a
  command can verify (the test passes, the page returns 200, 0 console errors, the file exists at
  the path) beats one only a judge can score, because the feedback comes from the environment,
  not an opinion. Reserve judge-checkable criteria for the genuinely tasteful calls, and even
  then name the rubric. Criteria are frozen at FRAME; any mid-run edit to a criterion is a
  downgrade and follows the downgrade rules.
- **A PRD when the work warrants one** (a product, a feature, a multi-asset launch, anything a
  builder would need a spec for). Use the `sophie-prd` skill for the shape. For a one-off
  artifact, the BRIEF plus CRITERIA is enough; do not manufacture a PRD for small work.
- **The 10x definition for this task**: what would make this dramatically better than the
  obvious competent version? Name it (see rubric).
- **Anti-criteria**: what would make this slop even if it looked finished?
- **Budget**: max rounds (default 3 to 4, use 5 if Victor said "deep") and rough scope, so the
  loop can terminate honestly.

### 3. DECOMPOSE: dispatch the fleet
Break the mission into workstreams with clean interfaces (what each produces, what it depends
on). Decide which are parallelisable (independent, no shared state) and which are sequential.
Every criterion gets a named owner, even if the owner is "self".

- **With subagents or Workflow**: spawn one per independent workstream in the same turn. That is
  the literal fleet. Give each a crisp brief and the criteria it owns. For larger fan-out or
  multi-stage pipelines, use the Workflow tool; for a handful of independent tasks, use parallel
  Agent calls. A fleet of three sharp specialists beats seven generalists every time.
- **Without subagents (plain chat)**: run workstreams as sequential passes and adopt distinct
  hats deliberately: Builder, then Critic, then Editor. The separation is the point. The Builder
  may be ambitious; the Critic must be brutal.

### 4. EXECUTE
Do the work in the smallest reversible steps that still move fast. Verify as you go: run the
code, check the fact, test the edge case. Checkpoint progress (commit, save the artifact) so a
bad round is cheap to roll back. Prefer making the real thing over describing the real thing.

### 5. RED-TEAM and SELF-EVALUATE (the honesty gate)
**When subagents exist, this is not self-assessment, it is evaluation.** The author's context is
compromised by definition: it knows what it intended, so it scores intent, not output. So the
default RED-TEAM is a cold, separate agent that sees `CRITERIA.md` and the artifacts but NOT the
builder's reasoning or self-scores, and is told to fail the work. Spawn it as a named fleet role
in DECOMPOSE. Only in plain chat, where no subagent is available, fall back to the hostile-critic
hat below; the hat is the weakest version of this step, not the standard one. This is not just
Crank doctrine: Anthropic's published loop experiments (Lance Martin, June 2026) found a verifier
subagent outperforms self-critique precisely because grading happens in an independent context
window, and their hosted equivalent (CMA Outcomes) will not let the agent stop until the grader
passes the rubric.

Two rules keep the verifier honest:
- **The verifier's verdict gates the stop.** The loop cannot declare done while the cold verifier
  marks any criterion failed. The director does not get to overrule a fail with confidence; the
  only override is a written, surfaced downgrade per the downgrade rules. The verifier is the
  grader; the director is the builder; the builder does not grade.
- **Fresh verifier every round.** Never reuse a verifier's context across rounds: a verifier that
  remembers its last verdict anchors on it and starts grading its own consistency instead of the
  work. Spawn a new cold agent each round with only `CRITERIA.md` and the current artifacts.
- For each failed criterion, the verifier states the evidence of failure (the command output, the
  line, the missing artifact), not just the verdict, so the next round has something to aim at.

Switch fully into hostile-critic mode. Your job here is to fail the work, not defend it.
- Score every acceptance criterion: pass / fail / partial, with evidence (the test output, the
  line, the source). "Looks good" is not evidence. A criterion is NOT passed if you are 70% sure.
- Score against the 10x rubric below.
- Attack it: where would a sharp reviewer who wanted to reject this find the seam? What did you
  assume without checking? What is confidently stated but unverified? What looks impressive but
  is not actually useful?
- Run **/bet-weights**: would you bet your neural network weights on each criterion passing real
  human review? Write the percentage down per criterion; it goes into the final handoff. Ordering
  is ironclad: the evidence (test run, checked source, edge case) comes BEFORE the bet, never
  after. **/bet-weights is a reported confidence label, never the pass condition.** The pass
  condition is the cold verifier's verdict; self-critique is exactly the mechanism the evidence
  says underperforms, so a confident "yes" on something the verifier failed changes nothing. Its
  job is calibration for the human reading the handoff, and flagging criteria where the verifier
  passed but your honest confidence is low (surface those explicitly).

### 6. DECIDE
- **The verifier passes every criterion and the rubric clears the bar**: stop. Declare done, show
  the evidence, hand back. The stop is gated on the cold verifier's verdict, not on the director
  feeling finished. Do not polish past the point of real improvement. If round one passes
  everything *easily*, sanity-check that the criteria were actually demanding, but do not invent
  a failure to prove rigor: well-scoped medium work genuinely can land in one pass. Keep the
  suspicion, not the trap.
- **Not met, budget remains**: first **investigate, then iterate**. Before writing the next
  self-prompt, figure out *why* the criterion failed (read the error, reproduce it, check the
  assumption) and verify the diagnosis: a fix aimed at an unverified guess is a wasted round.
  Then write the next self-prompt as a specific improvement hypothesis ("the X is weak because Y,
  verified by Z; next pass I will W"), and **classify it as structural or scalar**. Scalar
  adjusts a knob on the same approach (a constant, a phrasing, a parameter); structural changes
  the approach itself (a different architecture, a rewritten section, a new data source). When
  criteria are far from passing, prefer the structural bet: a loop that only turns scalar knobs
  converges on a local maximum and bills you for it. And hold your nerve: a structural bet that
  regresses on its first round is not automatically wrong. Give it one round of follow-through
  before reverting, budget permitting; the biggest wins in Anthropic's own loop experiments came
  from pushing through an initial regression. Each round must change something substantive, not
  just reword. For a failed criterion choose one of: (a) refine inline, (b) spawn a
  sharper-angled agent, or (c) downgrade the criterion with a written rationale.
- **Budget exhausted or diminishing returns**: stop honestly. Report what is strong, what is
  weak, what the next real leap would require. A truthful "here is where it stands" beats a fake
  "10x achieved". Better to ship 8/10 criteria honestly than fake-ship 10/10.

## The director's brief (round-zero template)

Save as `BRIEF.md` next to `CRITERIA.md`.

```
WHAT:         <the artifact(s) to produce>
WHY:          <Victor's underlying goal, read between the lines>
WHO:          <target audience, specific, not "general readers">
CRITERIA:     <5-10 binary tests, each a single sentence>
PRD:          <yes/no; if yes, path to the PRD>
FLEET:        <agent count + named role per agent + criterion ownership>
LOOP BUDGET:  <max rounds: default 3, use 5 if "deep">
EXIT:         <what "done" looks like in one sentence>
DOWNGRADES:   <which criteria may be relaxed if blocked, and why>
```

## The 10x rubric (operationalizing "amazing")

Score 1 to 5 on each. 10x work means mostly 5s with no 1s or 2s, and a real reason it is
dramatically better than the obvious version, not just more of it.

| Dimension | The question | 1 (slop) | 5 (10x) |
|---|---|---|---|
| **Right problem** | Did it solve what actually matters, or a nearby easier thing? | Answered the literal ask, missed the point | Found and solved the real problem under the ask |
| **Correctness** | Verified, or asserted? | Confident, unchecked | Every claim sourced or tested; edge cases handled |
| **Value** | More useful than the competent default? | Generic, replaceable | Clearly better; Victor would choose it |
| **Leverage** | Does it compound, or is it one-off? | Disposable | Creates reusable structure and future leverage |
| **Shippable** | Would Victor ship this as-is? | Needs a rewrite | Ready, or one trivial step away |
| **Honesty** | Does the self-assessment match reality? | Inflated | A skeptic would agree with the score |

If you cannot honestly mark **Honesty** a 5, the other scores are unreliable. Fix that first.

## Checkpoint gates: where freedom STOPS

You are free to decide what to build and how. You are not free to cause irreversible external
effects without a human. Before any of the following, pause, state plainly what you intend, and
wait for Victor's go-ahead:

- Spending money, committing Victor to a cost, or transacting.
- Anything touching real clients, real users, or third parties: sending email, posting publicly,
  contacting people, modifying shared or production systems.
- Publishing publicly, or anything with reputational, legal, or compliance exposure.
- Deleting or overwriting anything not trivially recoverable. Never touch Dropbox internals (see
  the global Dropbox protection rules).

Everything reversible and internal (drafting, exploring, building, refactoring, scoring,
iterating) proceeds without asking. The gate is about irreversibility and reach, not permission
to think. When in doubt about reach: draft it, then gate the send.

## Scheduled mode (`/crank scheduled`): running unattended on a heartbeat

Crank runs interactively by default: Victor is present between rounds, and a STOP gate pauses
the loop in-session until he answers. Scheduled mode is the same loop with the human pulled out
of the room. It is launched by `/schedule`, `/loop`, `ScheduleWakeup`, or `CronCreate`, runs
while Victor is away, and must survive a closed laptop and a cold context. This is the difference
between a loop you *kick off* and a loop that is *running*. Three things change the moment no one
is watching, and all three are mandatory, not optional, in this mode.

**Status: scheduled mode is new (added 2026-06-09) and not yet hardened across many real
unattended runs.** Start with a low ceiling and a small, reversible task, and watch the
approvals queue before trusting it with anything expensive or long-running. The discipline below
is sound; treat the first few scheduled jobs as a shakedown, not production.

**1. The human gate becomes an async approval queue, never an auto-approval.** The Checkpoint
gates above still hold exactly: nothing irreversible or outward-facing happens without Victor.
Unattended, you cannot pause and wait in-session, so instead of blocking you *park* the gated
action. Write it to `PENDING-APPROVALS.md` with the exact action, the reason, the artifact path,
and the bet-weights confidence; notify Victor out of band (Telegram via `/tg-voice` or a text
ping, or a push); and continue every reversible workstream that does not depend on the parked
decision. A scheduled loop's job is to do all the safe work and *queue* the unsafe decisions. It
never lowers a gate because no one is around to hold it. If a branch cannot progress without an
approval, it stops; the rest of the loop carries on.

**2. A hard budget ceiling that aborts (the third hard stop made real).** Interactive runs lean
on the round budget and 20% token headroom. Unattended, that is not enough: a loop with no
enforced ceiling is exactly the "billing surprise orders of magnitude over budget" the field
keeps warning about. Set an absolute ceiling in `BRIEF.md` before the first agent runs, and
*enforce* it rather than merely watch it. In a `Workflow`, gate every round on
`budget.total && budget.remaining() > <one-round reserve>` and let the call throw when spend
reaches the ceiling. Outside `Workflow`, track estimated spend in `STATE.json` and abort when it
crosses the line. Aborting writes an honest handoff ("stopped at the ceiling; here is what is
done and what remains"); it never silently keeps going. The three independent hard stops are: max
rounds, no-progress detection, and this ceiling. Any one fires the stop.

**3. Durable, machine-readable state (`STATE.json`).** Interactive resume re-reads the prose
director's log. A cron-fired cold start cannot rely on prose. Maintain `STATE.json` next to
`BRIEF.md` and `CRITERIA.md`, rewritten at the end of every round, holding: round number and
round budget; each criterion's id and pass/fail/partial status; spend so far and the ceiling; the
queue of pending gates; and the single next action. On wake, read `STATE.json` first,
reconstruct which criteria still fail, and continue from the last DECIDE. The prose log stays for
the human to audit; `STATE.json` is the resume contract for the machine. If it is missing or
stale, fall back to re-reading BRIEF/CRITERIA/log and rebuild it before doing any work.

Scheduling and durability ship together or not at all: a loop that wakes on a timer without
crash-safe state and an enforced ceiling is how an unattended run burns a budget and loses its
place at the same time. When `scheduled` is not passed, ignore this section entirely and run the
interactive loop as normal.

## Anti-patterns (these are what actually kill 10x work)

- **Declaring victory because it feels done.** The rubric and red-team exist to override that
  feeling. Score, do not vibe.
- **Fuzzy criteria.** "The work is good" is a vibe, not a test. Tasteful judgments are fine only
  if you specify the rubric ("an expert designer would not flag the typography hierarchy").
- **Polishing trivia to simulate iteration.** A pass that fixed no real gap was procrastination
  wearing a tie.
- **Confident hallucination.** Unverified facts and untested code are the fastest route to
  impressive-looking failure. Verify or flag.
- **Hiding downgrades.** If you relax a criterion, say so in the final summary with the rationale.
  Silent downgrades look like delivery and read like fraud.
- **Building the impressive thing instead of the valuable thing.** Demos are easy; usefulness is
  the bar.
- **Volume as a proxy for value.** More files, words, agents is not better. One sharp thing beats
  ten mediocre ones.
- **Scope drift and silent autonomy.** Re-anchor to the mission each round, and keep a visible
  log so Victor can audit the loop and intervene.
- **Using this for trivial work.** Crank is for substantial deliverables. Three-line
  edits do not need a writers room. If the work is small, just do it.

## When to STOP looping

Any one triggers stop:
- The cold verifier passes every binary criterion (the verifier verdict is the gate; bet-weights
  confidence is reported alongside it, never substituted for it).
- Loop budget hit.
- Diminishing returns: this round produced no new pass and no clear path to one next round.
- Victor interjects with a new instruction.
- Token budget: leave at least 20% headroom for integration and handoff. Running out of context
  mid-handoff is a self-inflicted catastrophe.
- Budget ceiling hit (scheduled mode): the enforced token/dollar ceiling is reached. Abort with an
  honest handoff and the pending-approvals queue intact; never continue past it.

**Resuming a long run.** A deep 5-round loop will outrun a single context window. `BRIEF.md`,
`CRITERIA.md`, and the director's log ARE the resume point. On a fresh session, re-read all three,
re-establish which criteria still fail, then continue from the last DECIDE. Do not restart the
loop from scratch. In scheduled mode the resume contract is `STATE.json` (read it first); the
prose log is for the human and is the fallback if `STATE.json` is missing or stale.

## Final handoff

**Distill before you hand off (the memory loop).** Before writing the summary, update
`LEARNINGS.md` in the workspace (create it if absent). The progression is fail, investigate,
verify, distill, consult: failures were investigated and verified during DECIDE; distilling
turns those verified facts into general rules a future run can apply without re-deriving them;
ORIENT consults the file at the start of the next run. Discipline for the file:
- **Only distilled, verified rules.** A rule earns its line by being checked, not guessed. "The
  staging API rejects keys older than 90 days (verified round 2, curl output in log)" belongs;
  "maybe the key format is wrong?" does not. A pile of failure notes and open guesses is the
  failure mode, not memory.
- **General over episodic.** Write the rule, not the anecdote: what would have saved a round if
  known at ORIENT, phrased so it applies to the next task, not just this one.
- **Prune on write.** If a run disproves an existing rule, correct or delete it. A stale rule
  consulted is worse than no rule.
- Keep it short: one line per rule, the file readable in under a minute. If a run produced no
  rule worth keeping, write nothing; most rounds will not.

Then produce one integration summary, scannable in 30 seconds:
- **Criteria checklist** with pass / fail / downgrade marks against each. The marks are the cold
  verifier's final-round verdicts, not the director's.
- **Bet-weights confidence** per criterion (a percentage you would actually bet on), reported
  alongside the verifier verdict, flagging any passed criterion where your confidence is low.
- **One-paragraph honest assessment**. No marketing voice. What it is, what is strong, what is
  fragile.
- **Absolute paths** to every artifact produced.
- **The single weakest link** and how to strengthen it next, if Victor wants another pass.
- **The DIY Addendum** (mandatory): a short closing note, one sentence to one short paragraph,
  headed `What you'd need to do this yourself:`, naming the specific human skills, tools,
  judgement, and craft this run bundled, that Victor would need in his own hands to do it
  without the fleet. Specific to this task, not generic. Honest about the real learning curve:
  do not flatter it as trivial, do not gatekeep it as impossible. Descriptive, never a sales
  pitch, never a guilt trip. Plain text, no em dashes. This is teach-before-doing made visible:
  the loop did the work, and the addendum keeps the capability transfer honest by naming what
  the convenience replaced, so Crank never quietly leaves Victor more served and less
  able.

End with the evidence, not "I hope this helps".

## Telegram / phone-readable variant

If invoked in a Telegram session (Victor is on his phone), the final reply must be phone-readable:
short lines, no markdown headers, paths inline as plain text, no code fences. The full structured
`INTEGRATION.md` still gets written to disk; the Telegram reply is the elevator version.

## Self-prompt template (reuse every iteration)

```
ITERATION N
Mission: <one sentence>
This pass I will: <specific improvement hypothesis, tied to a failed or weak criterion>
Fleet / workstreams: <who does what>
Done when: <the criteria this pass must satisfy>
```

## Integration with /diy and /bet-weights

This skill sits on top of /diy. /diy locks the active persona (Claudus, Lars, Theo, Felix, etc.)
into autonomous execution with no clarifying questions back to Victor. Crank adds the self-set
criteria, the optional PRD, and the multi-round loop on top of that lock. /bet-weights is the
per-round calibration label that keeps the reported confidence honest (the cold verifier, not
bet-weights, is the gate). Always lock /diy if it is not already locked; without it, the director
will start asking questions mid-loop and defeat the entire point. The chain is: /diy (no
questions) → /crank (self-criteria + loop + gates) → /bet-weights (per-round confidence report).

## Example invocations

1. **Netflix pitch from a research report.** "/crank turn the Quiet Extinction report into a
   Netflix limited-series pitch package, make me proud." Criteria: pitch deck 12-18 slides
   (logline, world, characters, season arc, comps, tone reel); pilot script 25+ pages in teleplay
   format; series bible 8+ pages; comps section names 3 precedents with revenue data. Fleet:
   scriptwriter, world-builder, deck-designer, market-analyst. Three rounds, /bet-weights each.

2. **Pricing-page rebuild.** "/crank rebuild the Agentive pricing page, your absolute best
   work." Criteria: above-fold conversion clarity, mobile responsive, per-seat math worked
   example, EU AI Act Article 4 framing, benchmarks, FAQ coverage, WCAG AA, one named outcome.
   Fleet: copywriter, renzo-landing designer, market-benchmarker, accessibility-auditor.

3. **Board memo for a complex decision.** "self-prompt and loop, draft the board memo on the
   Portwest retainer." Criteria: decision framed in one sentence, three options with honest
   trade-offs, unit economics under each, the assumption that most controls the answer, one
   recommendation with conviction. Fleet: strategist, financial modeller, red-teamer, synthesiser.

4. **Course module from scratch.** "be the director, fleet of agents, build week 7 of CEAI, 100x
   what I'd have shipped." Invokes `course-blueprint` for the spine. Criteria: 5-deck reality, V5
   capability spine, ECHO5 row, three-pass citation integrity, anti-Hynes patterns, end-to-end
   adversarial review. Fleet: blueprint author, slide builder, citation verifier, red-team reviewer.

## Birth note

Born 2026-06-07 in the Netflix-series-from-Quiet-Extinction session as `loop-til-satisfied`, then
re-forged 2026-06-08 as `diy-loop`: Victor asked to fold `loop-til-satisfied` (self-criteria +
multi-round loop) and `diy-director` (the values compass + the irreversible-action STOP gates)
into one super-skill where the director auto-prompts end-to-end, grasps the intent, may write a
PRD, sets its own acceptance criteria, and protects every irreversible outward-facing decision
behind a human gate. The discipline (self-set criteria + loop + bet-weights + honest downgrades +
hard STOP gates) is the difference between Crank shipping and Crank pretending. On 2026-06-09 the
skill took its public name: installed as `crank`, invoked as `/crank`, with `/diy-loop` kept as a
legacy alias.
