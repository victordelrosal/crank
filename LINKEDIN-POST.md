# Launch post (LinkedIn)

Victor's final cut, 2026-06-09. Plain text, paste-ready. Claims verified (see research/). "Link in the comments" points to github.com/victordelrosal/crank.

---

The AI coding world spent this week arguing about one word: loops.

Peter Steinberger set it off: "you shouldn't be prompting coding agents anymore. You should be designing loops that prompt your agents." Boris Cherny, who built Claude Code, says it plainly from the inside. He doesn't prompt Claude anymore. He has loops running that prompt Claude, and he landed 259 pull requests in a month doing it. Addy Osmani gave it a name: loop engineering.

A six-word idea pulled in millions of views while half the people sharing it argued about what it actually meant.

Here is the plain version, because I had to work it out for myself too.

When you prompt an agent, you are the loop. You read the output, decide what's wrong, type the next instruction, and go again. You are the while-condition and the retry logic, running in your own head. Your ceiling is your own availability: being in the loop when needed.

Designing a loop means you write that harness once. It writes the prompt, runs the agent, checks the result against a real test, and decides whether to stop or go again. You stop being the operator and become the person who built the operator.

It isn't magic, and it isn't just a cron job. A cron job runs a fixed script. A loop runs a model that reads the situation, picks the next move, and checks its own work. That last part is where it lives or dies.

Two things the hype keeps skipping.

Verification is the moat, not the loop. The loop is plumbing. A loop with a weak check will fail confidently a thousand times and send you the bill (Uber capped engineers at $1.5k per tool after burning a year of AI budget in four months!)

And a good loop shouldn't quietly de-skill you. The faster it ships code you didn't write, the wider the gap between what exists and what you actually understand. I don't want to wake up unable to explain my own system.

So I built one and put it on GitHub. I call it Crank, because that is the whole idea: you turn it once and it runs the loop for you.

It's a Claude Code skill that sets its own acceptance criteria, runs a small fleet of agents, and hands the work to a separate agent whose only job is to try to fail it before it reaches me.

One run checked 14 podcast episodes against their own canon in 44 seconds. To make it work I just described what "wrong" looked like, and the loop did the rest.

That's the shift in one line. Stop being the thing inside the loop. Build the loop, give it a check it can't talk its way past, and stay the engineer.

Link in the comments.
