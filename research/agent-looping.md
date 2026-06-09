To view keyboard shortcuts, press question mark
View keyboard shortcuts
Post

See new posts
Conversation
Shann³

@shannholmberg
what is agent looping

for the last two years we prompted agents one task at a time. that is starting to change

instead of asking an agent to build the landing page and then driving every step yourself, you set up a loop that handles discovery, planning, the work, checking, and iterating until the goal is met

looping is a setup you build. almost any agent harness can run it, it just depends on how you wire it up

at its simplest, looping is one agent working on itself:

> researches
> drafts
> checks the draft against a goal
> fixes what is weak
> runs that cycle again until the work clears the requirements

you are not prompting each step anymore. the agent repeats the cycle for you

the bigger version is a fleet looping. you give an orchestrator agent a goal, it breaks the goal into pieces, hands each piece to a specialist agent, and those specialists hand smaller jobs to their own subagents

the whole tree keeps looping through discovery, planning, execution, and verification until the goal is met

one agent looping is like a person redoing their own draft. a fleet looping is a whole team running a project end-to-end

you create a goal, and the system runs the loop until it finishes within the reqs you set

open and closed looping:

OPEN LOOPING is exploratory. it still has conditions and a goal, but you give the agent or the fleet a wide space to move in. it can try different paths, discover things, build something you did not fully spec out

this is the exciting end, it is what Peter and others are doing, and tbh it is where I want to spend more time

the catch is cost, an open loop with real room to explore burns an insane amount of tokens. for the 90 percent of people without an unlimited budget it is not runnable yet, and pointed at projects with a loose standard it turns into a slop machine

CLOSED LOOPING is bounded. a human designs the end-to-end path first:

> clear goal
> defined steps
> an eval at each step
> a point where it stops or hands back to you (and feeds back performance data)

the agents still loop, but inside framework you built. it gets better every run because each pass feeds the next, and it runs on a normal budget because the path is tight.

for most marketing work, closed is the one that pays off today.

> the orchestrator owns the goal
> the specialists own the steps
> the subagents do the narrow work
> an eval gate make sure its not slop
Quote
Peter Steinberger 🦞

@steipete
·
Jun 7
Here’s your monthly reminder that you shouldn’t be prompting coding agents anymore.

You should be designing loops that prompt your agents.
11:00 AM · Jun 8, 2026
·
535.1K
 Views
Relevant
View quotes

