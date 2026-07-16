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
  irreversible or outward-facing. Model routing is automatic: the fleet shifts between fable,
  opus, and sonnet per task shape so Victor never has to /model-switch mid-run, opens every run
  by announcing the gear, and announces every shift as it happens.
  Supersedes the older loop-til-satisfied and diy-director skills.
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
read costs nothing, a rule you re-derive costs a round. Also consult the global file
`~/.claude/crank/LEARNINGS.md`: workspace learnings are project truths, global learnings are
craft truths that apply to every run anywhere.

**Ground before you frame.** When the work modifies an existing system (a codebase, a live
page, a corpus, a deployed config), reading about it is not understanding it. Before FRAME
locks the contract: locate the actual artifacts the work will touch (the call sites, the
files, the data), then write a short explain-back of how the thing actually works into the
Round 0 entry of `LOG.md`, marking each load-bearing claim VERIFIED (you looked) or ASSUMED
(you inferred). Criteria are frozen at FRAME, so a contract written on an ungrounded mental
model optimizes the wrong thing for the entire run. The field's summary of this failure class
is that the most expensive bugs come from shared misunderstanding, not syntax (Uriostegui,
"Stop telling the agent what to do", 2026, and its ClineFlow repo; captured in research/).
Uriostegui has a human verify the agent's mental model before objectives are introduced; Crank
has no human in the loop, so reality plays that part: the explain-back is checked against the
artifacts, not against Victor. Greenfield work compresses this to a sentence; brownfield work
never skips it.

**Baseline before you improve.** When the mission is improvement-shaped ("optimize X", "make Y
faster", "lift the quality of Z"), measure or run the unmodified starting state at Round 0 and
record it in `LOG.md` before changing anything. Every later claim of improvement is proved
against that baseline, not against memory of it. Karpathy's autoresearch makes the baseline
run of the untouched script mandatory before any mutation, for exactly this reason (captured
in research/loop-benchmark-2026-07.md).

**Announce the gearbox FIRST (non-optional, every run).** The very first thing Crank says to
Victor, before ORIENT's findings, before any tool talk, is one visible gearbox block: which gear
the session itself is in right now, and how the automatic transmission will route the run. Format
(adapt the specifics, keep the shape):

```
⚙ GEARBOX (automatic). Session gear: Fable (top).
Routing this run: planning + final verify stay in top gear (~10%, Fable is the
hungry model: it plans and judges, it never executes); builders dispatch in
drive (Opus); mechanical sweeps in low (Sonnet). I'll announce every shift.
```

If the session is already in Fable, say so and say that top gear is therefore covered for
director thinking, and that execution will still downshift (Fable executes nothing). If the
session is in Opus or Sonnet, say that too, and that top-gear decisions will be spawned as
`fable` subagents. Victor should never have to ask which gear the work is in; the run opens by
telling him, and every later shift is announced as it happens (see "Announce every shift" in the
transmission rules).

**Know which model is running.** Note the model at ORIENT and match the scaffolding to it. On a
non-Fable model (Opus, Sonnet, Haiku), load the `fable-mind` skill before FRAME and let
`fable-effort-triage` own the loop-fitness call: the loop's structure is doing more of the work,
so keep every gate at full strength. On a Fable-class model, the discipline still holds but
FRAME may be compressed for small, well-scoped work; do not add ceremony the model natively
covers. Either way the gates and the cold verifier never compress. The session model only
governs the director's own thinking; every dispatched agent gets its gear from the transmission
(see "The transmission: automatic model routing"), regardless of what the session runs.

### 2. FRAME: self-prompt the contract (write it down before working)
This is where you prompt yourself instead of waiting for Victor. Produce, in the workspace:

- **`BRIEF.md`** using the round-zero template below. Half a page. It locks the contract before
  you spend tokens.
- **`CRITERIA.md`**: binary acceptance criteria, each one sentence with a clear yes/no test.
  Scale the count to the work's shape: code-shaped work wants many granular asserts (a dozen-plus;
  too few and the evaluator rubber-stamps a weak build), taste-shaped work wants a handful with a
  named rubric (a long list of judgment calls is theatre that converges on your own assumptions).
  Five to ten is the usual middle; go higher for code, lower for vision. Good: "the pilot script
  is 25+ pages in industry-standard teleplay format with
  sluglines, action, dialogue." Bad: "the pilot is good." Draw them from Victor's stated goal
  *and* your read of the intent between the lines. If a criterion cannot be checked yes/no,
  rewrite it until it can. **Prefer environment-checkable over judge-checkable**: a criterion a
  command can verify (the test passes, the page returns 200, 0 console errors, the file exists at
  the path) beats one only a judge can score, because the feedback comes from the environment,
  not an opinion. Reserve judge-checkable criteria for the genuinely tasteful calls, and even
  then name the rubric. Criteria are frozen at FRAME; any mid-run edit to a criterion is a
  downgrade and follows the downgrade rules.
- **Loop-fitness check.** Once the criteria are written, look at the ratio. If most are
  environment-checkable, the task is loop-shaped: run the full budget. If most are
  judge-checkable (taste, tone, design, product feel), the feedback signal is soft and the loop
  will converge on its own assumptions instead of Victor's vision; the field's working loops
  (code review against a scorer, templated generation) all have fixed feedback, and
  vision-heavy work is where loops are documented to fail. Respond by shortening the budget
  and inserting a **direction checkpoint after round 1**: interactively, show Victor one
  representative sample (a screen, a page, an excerpt) and get a nod before spending the
  remaining rounds; in scheduled mode, park the direction check in `PENDING-APPROVALS.md` and
  continue only the environment-checkable workstreams until it clears. This is a checkpoint
  gate, not a clarifying question, so it does not violate the /diy lock. And be willing to
  conclude the work is not loop-shaped at all: if it is both one-off *and* almost entirely
  judgment-checkable (a single bespoke artifact where "done" is a taste call), a loop has
  nothing objective to converge on and will just amortize its setup over a vision it is guessing
  at. Say so plainly and offer one well-aimed pass with a single red-team instead of a
  multi-round loop. Looping is the tool here; it is not a tax every task has to pay.
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
  Instruct every builder to open its report with a three-line readback: what it understood the
  brief to be, the approach it took and how the criteria it owns will be verified, and the
  assumptions it made. The director audits the readback against the BRIEF before reading the
  build; a wrong readback caught in three lines is a round saved.
- **Without subagents (plain chat)**: run workstreams as sequential passes and adopt distinct
  hats deliberately: Builder, then Critic, then Editor. The separation is the point. The Builder
  may be ambitious; the Critic must be brutal.
- **Model mix**: route every dispatched agent through the transmission (see "The transmission:
  automatic model routing" below). The defaults, so they cannot be misremembered: builders run
  `opus`; mechanical passes (scrapes, sweeps, fixes) run `sonnet` at low effort; the final-round
  verifier and any high-stakes red-team run `fable`. Each FLEET role in `BRIEF.md` names its
  gear, and Victor is never asked to `/model`-switch: the fleet shifts itself.

### 4. EXECUTE
Do the work in the smallest reversible steps that still move fast. Verify as you go: run the
code, check the fact, test the edge case. Checkpoint progress (commit, save the artifact) so a
bad round is cheap to roll back. Prefer making the real thing over describing the real thing.

**Ground the plan before building on it.** Each workstream's first act is to check its plan
against the real artifacts it is about to touch: do the named files, functions, endpoints, and
data exist and behave as the plan assumes? Every mismatch goes to the assumption ledger and the
plan is adjusted before the build starts. A builder that discovers reality mid-build improvises
silently, and silent improvisation is where vision drift and broken call sites hide.

**Keep an assumption ledger.** Every time the builder decides something the BRIEF does not
specify (an architecture choice, a tone, a look, a scope call), log it in one line in `LOG.md`
under `ASSUMPTIONS`. A plan never captures the whole vision; the agent fills the
gaps, and unlogged assumptions are where vision drift hides. The ledger makes the gap-filling
visible so Victor can correct it in thirty seconds at the handoff instead of discovering it in
the artifact. Logging an assumption is not a license to skip the gates: an assumption that
touches money, reach, or irreversibility is still a STOP.

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

**Scripts before verifiers, and scripts as a gate.** Run every mechanical check (file
existence, frontmatter validity, counts and caps, style law such as the em-dash ban, link
resolution) as a cheap script BEFORE spawning the cold verifier, and treat the suite as a
blocking gate, not advice: a round does not reach the verifier until its scripts pass.
Verifiers grade judgment; scripts grade mechanics. A verifier that burns its one cold read
catching defects a five-line script would have caught has wasted the most expensive attention
in the loop.

**The evaluation surface is frozen.** The check scripts, the verifier's instructions, and the
criteria they enforce are part of the contract, and the builder does not touch them. A fix
that edits the test instead of the work is a downgrade in disguise and follows the downgrade
rules (written, surfaced, never silent). This is Karpathy's anti-cheat rule (the eval function
is unmodifiable) and Anthropic's harness law ("unacceptable to remove or edit tests") in
Crank's terms.

These rules keep the verifier honest:
- **The verifier's verdict gates the stop.** The loop cannot declare done while the cold verifier
  marks any criterion failed. The director does not get to overrule a fail with confidence; the
  only override is a written, surfaced downgrade per the downgrade rules. The verifier is the
  grader; the director is the builder; the builder does not grade.
- **Fresh verifier every round.** Never reuse a verifier's context across rounds: a verifier that
  remembers its last verdict anchors on it and starts grading its own consistency instead of the
  work. Spawn a new cold agent each round with only `CRITERIA.md` and the current artifacts.
- **The verifier drives the artifact.** For anything runnable (a page, an app, a script, a
  pipeline), the verifier exercises it the way a user would (load it, click it, run it,
  feed it the edge case) and grades the observed behavior; reading the source is not
  verification of a runnable thing. Evidence is the screenshot, the output, the rendered
  state. Anthropic's harness experiments converged on the same law: the evaluator functionally
  tests as a human user, and self-grading without execution is systematically lenient.
- For each failed criterion, the verifier states the evidence of failure (the command output, the
  line, the missing artifact), not just the verdict, so the next round has something to aim at.
- **Fixed verdict format.** Instruct every verifier to return exactly: (1) a verdict table, one
  row per criterion (id, PASS/FAIL/PARTIAL, one line of evidence); (2) a ranked defect list with
  file and quote; (3) a one-line overall verdict. A fixed shape makes round-over-round
  comparison mechanical and lets scheduled mode fill STATE.json straight from the verdict
  instead of re-summarizing prose.
- **Cap the verifier's payload.** A verifier handed more than it can actually contextualize in
  one cold read (the field's empirical line for code review is roughly 1,000 changed lines)
  stops grading and starts skimming, and its verdict goes noisy in both directions. Scope each
  verification to the criterion: hand the verifier only the artifacts that criterion needs, and
  if a round's output is too large to grade in one cold context, split the verification into
  multiple scoped passes (or multiple verifiers) rather than one overloaded one. Plan EXECUTE
  checkpoints with this in mind: rounds that produce verifier-sized increments grade cleanly.

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
  When the failure is a judgment call rather than a hard error, read the raw transcript of the
  round (the agent's and verifier's actual output, not your summary of it), find the line where
  the judgment diverged from the contract, and aim the next self-prompt at that exact moment. The
  signal is in the trace, not the artifact.
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
  sharper-angled agent, (c) restart the build from the frozen contract when the contract is sound
  but the build itself has become the mess and throwing it away is cheaper than untangling it
  (interactive mode only, never in scheduled mode, since deleting work on a model's judgment with
  no human in the room is a foot-gun), (d) downgrade the criterion with a written rationale, or
  (e) fork the bet: when a criterion has resisted two rounds of single-path iteration, or a
  structural bet is genuinely uncertain, spawn two or three parallel candidates with
  deliberately different angles and let the fresh cold verifier pick the winner. Branching
  beats iterating harder once a lineage is stuck (the tree-search and archive-and-branch
  results in research/loop-benchmark-2026-07.md); it also costs multiples, so fork only when
  the stuck round has already paid for the evidence that iteration is not working, and prefer
  it interactively where tokens are flat-rate.
- **Budget exhausted or diminishing returns**: stop honestly. Report what is strong, what is
  weak, what the next real leap would require. A truthful "here is where it stands" beats a fake
  "10x achieved". Better to ship 8/10 criteria honestly than fake-ship 10/10.

## The transmission: automatic model routing

Victor drives automatic, not stick. He should never have to stop and `/model`-switch between
Fable for planning, Opus for building, and Sonnet for menial work; that is Crank's job. The
session model is whatever it is; every agent the loop dispatches carries an explicit model
override chosen by task shape. The gearbox is real and already installed: the Agent tool takes
a `model` parameter (`fable`, `opus`, `sonnet`, `haiku`) and Workflow's `agent()` takes
`opts.model` plus `opts.effort`. Use them on every dispatch; an agent spawned without a
deliberate gear choice is a missed shift.

| Gear | Model | Route here | Share |
|---|---|---|---|
| **Top** | `fable` | FRAME on high-stakes or ambiguous missions; the structural bet after a stuck round; the cold verifier on judge-checkable criteria and on the final round; red-teaming anything outward-facing; the one decision the whole run hinges on | ~10% |
| **Drive** | `opus` | Builders and execution workstreams; routine per-round verification; integration and handoff writing. The default gear: when in doubt, drive | ~85% |
| **Low** | `sonnet` | Mechanical work: scraping, grep sweeps, format fixes, file moves, link checks, bulk transforms, data plumbing, running check scripts. Pair with `effort: 'low'` | ~5% |
| **Crawl** | `haiku` | Truly trivial bulk mechanics (hundreds of identical checks or extractions) where even Sonnet is overkill | rare |

Shifting rules:
- **Announce every shift, out loud, as it happens.** The gearbox is transparent, never silent.
  The run opens with the gearbox block (see ORIENT), and every dispatch or mid-run gear change
  gets one visible line in the reply, e.g. `⚙ shifting to low (sonnet): link sweep across 40
  pages` or `⚙ top gear (fable): cold verify, final round`. Victor always knows whether the
  work of the moment is in Fable, Opus, or Sonnet without asking.
- **Top gear plans and judges; it never executes.** Fable is the hungry model: reserve it
  (~10% of the run) for FRAME on hard missions, the structural bet, the final cold verify, and
  red-teaming outward-facing work. Execution always downshifts to drive or low, even when the
  session itself is running Fable.
- **Route by task shape, not by mood or habit.** Judgment-heavy shifts up; mechanical shifts
  down; everything else stays in drive. The shares above are a sanity check, not a quota: a
  scrape-heavy run is legitimately mostly low gear, a strategy run mostly top.
- **The verifier rides one gear above its builder** whenever affordable. Verification is where
  the quality actually comes from; a Sonnet builder graded by an Opus verifier is a good trade,
  an Opus build graded by a Fable verifier on the final round is the best one in the box.
- **Escalate on repeated failure.** A workstream that fails the same criterion twice on its
  current gear gets one round on the next gear up before the director reaches for a fork or a
  structural rewrite. One shift is cheaper than a wasted round.
- **Downshift the moment work turns mechanical.** If a drive-gear agent's remaining job is
  applying a known fix across N files, that is a new low-gear dispatch, not a reason to keep
  paying drive rates.
- **The director cannot shift the session itself.** The main loop's model is set by Victor's
  `/model` and is out of the loop's reach; never ask him to change it mid-run. If director-level
  thinking needs top gear while the session runs something else, the answer is always the same:
  spawn a `fable` subagent for that single decision and fold its answer back. Not "raise effort
  and hope", not "ask Victor to switch"; a fable subagent. Effort settings tune within a gear;
  they never substitute for the gear.
- **Log the gear.** Every FLEET role in `BRIEF.md` names its model, and mid-run shifts are noted
  in `LOG.md` (a one-word annotation in DID is enough). An auditable transmission is one Victor
  can retune.
- **Flat-rate does not mean free.** When all gears bill the same, the routing still holds: it
  buys attention allocation and latency, not just money. On metered tokens it is also the
  difference between a loop you can afford and one you cannot.

## The director's brief (the `BRIEF.md` template)

Save as `BRIEF.md` next to `CRITERIA.md`.

```
WHAT:         <the artifact(s) to produce>
WHY:          <Victor's underlying goal, read between the lines>
WHO:          <target audience, specific, not "general readers">
CRITERIA:     <5-10 binary tests, each a single sentence>
PRD:          <yes/no; if yes, path to the PRD>
FLEET:        <agent count + named role per agent + model gear per role + criterion ownership>
LOOP BUDGET:  <max rounds: default 3, use 5 if "deep">
EXIT:         <what "done" looks like in one sentence>
DOWNGRADES:   <which criteria may be relaxed if blocked, and why>
```

## The director's log (`LOG.md`)

The run's journal, next to `BRIEF.md` and `CRITERIA.md`. The brief is the contract; the log is
the flight record. Together with the criteria they are the interactive resume contract (in
scheduled mode `STATE.json` leads and the log is the human-auditable fallback). Open it at
ORIENT with a Round 0 grounding entry, then append one entry per round, each short enough to
write in a minute:

```
## Round 0 (date)
GROUNDING:    <the explain-back: how the system actually works, each claim VERIFIED or ASSUMED>
BASELINE:     <improvement-shaped missions only: the measured starting state>

## Round N (date)
HYPOTHESIS:   <this round's improvement bet, marked structural or scalar>
DID:          <what actually changed, with paths>
ASSUMPTIONS:  <gap-filling calls made beyond the BRIEF, one line each>
VERDICT:      <the cold verifier's one-line verdict + per-criterion marks>
DECIDE:       <stop / iterate / downgrade, and the single next action>
```

Journal discipline (adapted from ClineFlow's journal system): record why, not just what;
decisions carry their rationale; entries are appended, never rewritten, so the trail stays
honest and a cold session can reconstruct the run from the log alone.

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
director's log (`LOG.md`). A cron-fired cold start cannot rely on prose. Maintain `STATE.json` next to
`BRIEF.md` and `CRITERIA.md`, rewritten at the end of every round, holding: round number and
round budget; each criterion's id and pass/fail/partial status; spend so far and the ceiling; the
queue of pending gates; and the single next action. On wake, read `STATE.json` first,
reconstruct which criteria still fail, and continue from the last DECIDE. The prose log stays for
the human to audit; `STATE.json` is the resume contract for the machine. If it is missing or
stale, fall back to re-reading BRIEF/CRITERIA/log and rebuild it before doing any work.

**4. The security tax: an unattended loop is an unattended attack surface.** Interactively,
Victor's eyes are the last line of defense; unattended, the loop is exposed for hours with no
one watching, so the gate itself has to carry the security review the human used to. Four
disciplines, all mandatory in this mode:
- **The gate includes a security check, not just a correctness one.** If a workstream produces
  code or config that could ship, the verifier's pass must include secret scanning, a dependency
  audit, and a basic SAST pass, not only "tests green". A loop that opens PRs faster than a human
  reads them will merge an injected secret or a vulnerable dependency on a green test alone.
- **Audit skill and connector sources before the loop uses them.** A loop that auto-reaches for
  a skill or MCP connector inherits every prompt injection hiding in its description. In
  unattended mode, only use skills and connectors already vetted and present in the workspace;
  never let a scheduled run install or fetch a new one on its own.
- **Sanitize what gets logged.** Long unattended runs scatter output across logs no one is
  reading. Keep verbose/debug logging off in scheduled mode and redact anything credential-shaped
  before it lands in `LOG.md`, `STATE.json`, or `PENDING-APPROVALS.md`.
- **Least privilege, re-audited.** The loop runs with the narrowest permission scope the task
  needs, and write/network scope added "just for this run" is removed at handoff, never left
  standing. Re-state the loop's actual permission scope in the handoff so scope creep is visible.

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
- **Optimizing a misunderstood contract.** The loop amplifies whatever FRAME locked in. If the
  mental model behind the criteria was never grounded in the real artifacts, every round
  polishes the wrong thing with increasing confidence. Ground first; the expensive failures
  are shared misunderstanding, not bad execution.
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
`CRITERIA.md`, and the director's log (`LOG.md`) ARE the resume point. On a fresh session, re-read all three,
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
  consulted is worse than no rule. Also delete any rule or scaffolding the current model now
  handles unaided: a harness that only ever grows is one nobody is re-reading, and last quarter's
  load-bearing workaround is this quarter's dead weight. This pruning never touches the
  scheduled-mode security disciplines, which are load-bearing, not overhead.
- **Promote craft rules to global.** If a distilled rule is about how to run loops, verify,
  budget, or author artifacts (craft) rather than a fact about this project, write it to
  `~/.claude/crank/LEARNINGS.md` as well as, or instead of, the workspace file, so every future
  run in every project inherits it. Same discipline applies there: verified rules only, prune
  on write.
- **Distill tools, not only rules.** If the run built a reusable instrument (a check script, a
  verifier prompt, a template, a scraper), promote it: workspace tools to `.loop/tools/`,
  craft-grade tools to `~/.claude/crank/tools/`, and reference each from the LEARNINGS line
  that explains when to reach for it. Prose rules transfer judgment; tools transfer
  competence, and a future run that reuses a verified script starts from capability instead
  of re-deriving it (the skill-library result: Voyager, Agent Workflow Memory).
- Keep it short: one line per rule, the file readable in under a minute. If a run produced no
  rule worth keeping, write nothing; most rounds will not.

Then produce one integration summary, scannable in 30 seconds:
- **Criteria checklist** with pass / fail / downgrade marks against each. The marks are the cold
  verifier's final-round verdicts, not the director's.
- **Bet-weights confidence** per criterion (a percentage you would actually bet on), reported
  alongside the verifier verdict, flagging any passed criterion where your confidence is low.
- **One-paragraph honest assessment**. No marketing voice. What it is, what is strong, what is
  fragile.
- **The assumption ledger**: every gap-filling call the builder made beyond the BRIEF, one line
  each, so Victor can spot vision drift at a glance and correct it cheaply.
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
