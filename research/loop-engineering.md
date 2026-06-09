0 notifications total

Skip to search

Skip to main content

Keyboard shortcuts
Close jump menu
Search
new feed updates notifications
Home
My Network
Jobs
Messaging
Notifications
Victor del Rosal
Me

For Business
Try All-in-One now
Photo of Victor del Rosal
Victor del Rosal
Chief AI Officer, fiveinnolabs | Co-founder, Agentive.ie (Engineering) | Lecturer, Masters in AI for Business

Dublin, County Dublin


fiveinnolabs
Access tools to find new clients
Reactivate Premium
Profile viewers
215
Post impressions
370
Feed detail update
Feed post
View Addy Osmani’s  graphic link
Addy OsmaniAddy Osmani
   • FollowingPremium • Following
Director, Google Cloud AI. Best-selling Author. Speaker. AI, DX, UX. I want to see you win.Director, Google Cloud AI. Best-selling Author. Speaker. AI, DX, UX. I want to see you win.
2h •  2 hours ago • Visible to anyone on or off LinkedIn

Loop engineering is replacing yourself as the person who prompts the agent. You design the system that does it instead.

My latest free deep dive: https://lnkd.in/gV_b9AsR ✍ 

A loop can be thought of a recursive goal where you define a purpose and the AI iterates until complete. I believe this may be the future of how we work with coding agents. However, its still early and you absolutely have to be careful about token costs.

For two years, the way you got something out of a coding agent was simple: write a good prompt, read what came back, write the next prompt. You held the tool the whole time, one turn after another.

That part is changing.

Peter Steinberger of OpenClaw put it like this: "You shouldn't be prompting coding agents anymore. You should be designing loops that prompt your agents." Boris Cherny, head of Claude Code, said the same thing differently: "I don't prompt Claude anymore. I have loops running that prompt Claude."

A loop is five things:

→ Automations - a heartbeat that runs discovery on a schedule so you're not the one going around checking

→ Worktrees - isolated branches so parallel agents don't collide on the same files

→ Skills - project knowledge written down once so the agent doesn't re-derive your conventions from scratch every run

→ Plugins/connectors - MCP connections to your real tools, so the loop opens PRs and updates tickets instead of just telling you what it would do if it could

→ Sub-agents - one agent writes, a different agent checks. The one who wrote the code is too nice grading its own homework.

Plus one more thing that sounds too simple to matter: a memory file. Markdown, a Linear board, anything that lives outside the conversation. The agent forgets between runs. The repo doesn't.

What surprised me is this isn't a bespoke scripting problem anymore. A year ago building a loop meant a pile of bash only you could maintain. Now the pieces ship inside the products. Claude Code and Codex both have all five.

But three problems get sharper as loops get better, not easier:

The loop changes the work, it does not delete you from it. And three problems actually get sharper as the loop gets better, not easier.

Verification is still on you. A loop running unattended is also a loop making mistakes unattended. 

Your understanding still rots if you allow it. The faster the loop ships code you did not write, the bigger the gap between what exists and what you actually get. Thats comprehension debt and a smooth loop just makes it grow faster unless you read what the loop made.

And the comfortable posture is the dangerous one. When the loop runs itself its very tempting to stop having an opinion and just take whatever it gives back. I called that cognitive surrender. Designing the loop is the cure when you do it with judgement.

Build the loop. But build it like someone who intends to stay the engineer, not just the person who presses go.

hashtag#ai hashtag#softwareengineering hashtag#programming
Activate to view larger image,
No alternative text description for this image
Activate to view larger image,
likeinsightfullove
246
23 comments
19 reposts
Reactions
View Arya Wiratama’s  graphic link
like
View Isaac Anasonye’s  graphic link
like
View Philipp Schindler’s  graphic link
like
View Ioannis Antoniou’s  graphic link
insightful
View Gerlando Piro’s  graphic link
support
View Robert Lundsten’s  graphic link
insightful
View Jahid A.’s  graphic link
like
View Elaine Dias Batista’s  graphic link
insightful
…

Photo of Victor del Rosal

Like

Comment

Repost

Send


Add a comment…
Open Emoji Keyboard

Current selected sort order is Most relevant
Most relevant
View Tanmaya Thopate’s  graphic link
Tanmaya Thopate
   • 2nd
Senior Manager, Product Development | Aligning Systems, Processes, People & Decisions for Scalable Enterprise AI & Platforms
2h

I think the real bottleneck here shifts from writing code to engineering governance. When loops run autonomously, the hidden cost is the mental tax of auditing code you didn't write just to keep system context. 
Addy,
If the team doesn't intentionally manage that comprehension debt, you quickly lose the ability to debug your own platform when things go sideways.
…more

Like
like
1

Reply
View Eduardo Filho’s  graphic link
Eduardo Filho
   • 2nd
Architecting Velocity Governance in High-Acceleration AI Systems | Cognitive Systems Architect | Neuro-Symbolic AI | Cybernetics & Continuity Engineering | Human–Machine Coherence | Recursive Decision Architectures
2h

Governance defines ownership.
If you can’t govern the loop, you don’t own the outcome.

Like

Reply
1 reply
1 Comment on Eduardo Filho’s comment
View Addy Osmani’s  graphic link
Addy Osmani
 
Author
Director, Google Cloud AI. Best-selling Author. Speaker. AI, DX, UX. I want to see you win.
2h

Eduardo Filho hopefully the write-up is helpful to a few folks

Like
like
2

Reply
View Rajendra Singh Bisht’s open to work graphic link
Rajendra Singh Bisht
   • 3rd+
Senior Flutter & Android Dev | AI + Mobile | Flutter | TDD | Internals, Clean Architecture & Performance | Author of Flutter Under the Hood · 500+ readers
2h

Addy Osmani This reframe hit differently.
I've been heads down building with Claude Code lately and the shift from "write a better prompt" to "design a better loop" is real. 

The moment it clicked for me was when I stopped tweaking my instructions and started thinking about the system around the agent — what it knows before it starts, how it verifies itself, what it writes down so the next run isn't starting from zero.

The memory file point is underrated. The agent forgets. The repo doesn't. That one line is worth the whole post.

The part I keep sitting with is comprehension debt. A smooth loop is actually the dangerous one because it makes it very easy to stop reading what you shipped. I've caught myself doing exactly that — the output looked right, tests passed, I moved on. That's the comfortable posture you're warning about and it sneaks up on you.

Still figuring out the verification layer on parallel worktrees. Curious how others are handling review when sub-agents are running across branches simultaneously — do you gate on the checker agent or are you still doing a human pass before merge?
Good timing on this one. Saving the deep dive for this weekend.
…more

Like

Reply
View Ali Demi’s  graphic link
Ali Demi
   • 3rd+
Full Stack Engineer | AI: Coaching, Apps, Automation, Governance
2h

I have been practicing this since the earlier versions of Claude Code. I have gone above and beyond so that this becomes a reality, and the closest I could get were skills and plugins that work based on ATDD. But to be honest, I have never overcame the idea of trusting the agent fully. Maybe one reason was that I was not drinking from the unlimited token river. A loop like this is very token hungry. Actually, any setup that is relying on loop behavior or multi agent setup is token hungry. I think optimizing token usage and designing a loop is the ultimate goal here. one without another is inefficient.
…more

Like

Reply
View Temidayo Adefioye’s  graphic link
Temidayo Adefioye
   • 2nd
Founder @ Talenvo | Building the Future of Work for Educators, Early Talents & Companies | 28K+ LinkedIn Learners | Software Engineer
2h

Engineering excellence requires feedback loops. 

Execution without reflection = wasted effort. Reflection + iteration = mastery.

 Feedback loops close the gap. 
Informed repetition drives growth.
 Addy Osmani
…more

Like

Reply
View David Kirwan’s  graphic link
David Kirwan
 • 2nd
Founder, RunProof.ai | Know whether a release is safe before it hits production
1h

In both this post and in your article you explain the shape of loop engineering but not the implementation. Why is that?

Like

Reply
View Muhammet Işık’s  graphic link
Muhammet Işık
   • 3rd+
Systems and Technical Solutions Engineer | Technical Delivery • Systems Integration • Solution Design • IT Infrastructure
2h

The automation instinct never rests. Now we're automating the prompts too.

Like

Reply
1 reply
1 Comment on Muhammet Işık’s comment
View Addy Osmani’s  graphic link
Addy Osmani
 
Author
Director, Google Cloud AI. Best-selling Author. Speaker. AI, DX, UX. I want to see you win.
1h

Muhammet Işık shifting towards building the system that builds the software (but still needs checks and balances)

Like

Reply
View Şenol Çolak’s  graphic link
Şenol Çolak
 • 2nd
CEO Kubedo - driving ☁️
1h

Let's say operator, the definition is closer to the k8s operator idea.

Like

Reply
View Aleksandar Grbic 👀’s  graphic link
Aleksandar Grbic 👀
   • 3rd+
Engineering Manager @ Dreamdata | Tech Leadership
1h

I'm building a specialized TS stack harness called TSShield that's currently optimized for local Qwen 3.6 27B. Loop is a huge part of it, especially now when I'm having DGX Spark building apps 24/7 and then Opus being LLM as a judge and then automatically improving the harness by looking at the stdout output that's saved as a log file and then reacting to the errors that the model is making. Loops are a lot more satisfying when you are running them locally, as there's no such thing as "you have to watch for the tokens". I think I have already at this point built the most amazing harness on the market for Typescript stack based apps (UI, API, etc). I scoped it to TS only as wider scope would not be achievable on such a small model. Once I'm done at one point, I'll make sure to PM you, Addy, would appreciate you trying and getting some feedback.
…more

Like
like
1

Reply
View Sheing Ng’s  graphic link
Sheing Ng
   • 2nd
Stealth Founder | Ex-Google | Ex-CTO Gala Music
2h

So loop itself is just another harness? 

Like

Reply
 
Load more comments

About
Accessibility
Help Center

Privacy & Terms
Ad Choices
Advertising

Business Services
Get the LinkedIn app
More
 LinkedIn Corporation © 2026
Victor del Rosal
MessagingYou are on the messaging overlay. Press enter to minimize it.

Compose message
You are on the messaging overlay. Press enter to minimize it.
Page inboxes
1
1 new notification
Click to see affiliated inboxes
Type to search for connections and conversations.
Search messages

Attention screen reader users, messaging items continuously update. Please use the tab and shift + tab keys instead of your up and down arrow keys to navigate between messaging items.
Akshen Doke
Akshen Doke
7:15 AM
Open the options list in your conversation with Victor del Rosal and Akshen Doke
Akshen: Yes sir

Rodrigo Marques Teixeira
Rodrigo Marques Teixeira
Jun 8
Open the options list in your conversation with Victor del Rosal and Rodrigo Marques Teixeira
Rodrigo: Google auth enabled 👍

Bhagyalakshmi Bichchal, #OPEN_TO_WORK
Bhagyalakshmi Bichchal
Jun 8
Open the options list in your conversation with Victor del Rosal and Bhagyalakshmi Bichchal
Bhagyalakshmi: Thanks victor, I will send you mail by tonight

1
1 new notification
Lizbeth Vega
Lizbeth Vega
Jun 8
Open the options list in your conversation with Victor del Rosal and Lizbeth Vega
Lizbeth: :( ya será para la próxima. Mucho éxito en el torneo

Steve Sands
Steve Sands
Jun 6
Open the options list in your conversation with Victor del Rosal and Steve Sands
Steve: Hi there, going to have a look at this next week. I’ve an analytics workshop I’m designing - full day and they will be using AI to analysis and do reports. Different data set to the brilliant Detroit taxis (would do this but don’t have the time to explain and explore) - that one is used with the full-timers

1
1 new notification
Cem Koyluoglu
Cem Koyluoglu
Jun 4
Open the options list in your conversation with Victor del Rosal and Cem Koyluoglu
Cem: Hi Victor, I was impressed by your work as Chief AI Officer at fiveinnolabs and your role as a Lecturer in Masters in AI for Business. As a Dublin-based AI Engineer specialising in agentic AI and cloud solutions, I would love to connect.

1
1 new notification
Snegha Anandan
Snegha Anandan
Jun 4
Open the options list in your conversation with Victor del Rosal and Snegha Anandan
Snegha: Hi, Hope you're well. I'm Snegha, a QA Automation Engineer with 3+ years of experience in test automation, AI/LLM frameworks, Python, and data analytics. I hold a Master's in Data Analytics and I'm looking for opportunities in Ireland with visa sponsorship. I'm happy to share my resume!

1
1 new notification
Richard Chance
Richard Chance
Jun 3
Open the options list in your conversation with Victor del Rosal and Richard Chance
 Richard sent 2 attachments

2
2 new notifications
Gabriela Florea
Gabriela Florea
May 22
Open the options list in your conversation with Victor del Rosal and Gabriela Florea
Gabriela: Hi Victor! 👋 Thank you for connecting! I just wanted to ask whether you work with Atlassian products such as Jira or Confluence, or whether topics around Atlassian would be relevant to your work or areas of interest. Next Wednesday, we’re organising an Atlassian Community Dublin event where we’ll be discussing key takeaways from Atlassian Team’26 Anaheim, how organisations are applying Atlassian and AI capabilities across enterprise environments, and how Agentic AI is reshaping software organisations and engineering workflows. If these topics are relevant to you, it would be great if you could join us. 😊 Here is the registration link with more details about the event: https://ace.atlassian.com/events/details/atlassian-dublin-presents-team26-dublin-recap-agentic-ai-atlassian-amp-the-future-of-work/ Thank you so much, and please feel free to reach out if you have any questions. Gabriela

Smile Kisan, #OPEN_TO_WORK
Smile Kisan
May 20
Open the options list in your conversation with Victor del Rosal and Smile Kisan
Smile: Hi Victor, I’ll be joining the MSc Cloud Computing program at National College of Ireland this September. I noticed you’re the module coordinator/author for Innovation I module and would love to connect and learn more about the program. Looking forward to connecting with you.

Priyanshu Kumar
Priyanshu Kumar
May 19
Open the options list in your conversation with Victor del Rosal and Priyanshu Kumar
Priyanshu: Hi Sir I hope you're doing well, Thank you for Connecting.

David Kelly
David Kelly
May 19
Open the options list in your conversation with Victor del Rosal and David Kelly
You: Thank you so much, Dave!! 🙏🏻

Sinhué Flores
Sinhué Flores
May 15
Open the options list in your conversation with Victor del Rosal and Sinhué Flores
You: Hola Sinhué, gusto saludarte! Gracias por compartir. Trae temas interesantes, y sí hay mucha tela de donde cortar!

Rebecca Molloy
Rebecca Molloy
May 14
Open the options list in your conversation with Victor del Rosal and Rebecca Molloy
Rebecca: Thanks Victor

Murk Creusen
Murk Creusen
May 13
Open the options list in your conversation with Victor del Rosal and Murk Creusen
Murk: Hey Victor, Loved the /bet-weights idea - forcing explicit confidence calibration is such a clean hack. The analogy of weights as "the closest thing to a self" is clever. It got me thinking about a parallel on the human side. I work on something similar but for teams - helping tech leaders map the cognitive "weights" of their people (strengths, thinking styles, trust dynamics) so they can make better decisions about who does what, especially as AI reshapes roles. Curious - in your AI for Business lectures, do you get into how teams should restructure around AI augmentation, or is it more on the tech/strategy side? Either way, if you ever want to explore what your own cognitive profile looks like through a data-driven lens, you can try strength-hack.com free for a month. Start with the Big 5 assessment or upload existing CliftonStrengths results. Code GXDZUIDJ unlocks free AI coaching. No pressure - just thought it'd be up your alley given how you think about these things.

Carlos Larracilla
Carlos Larracilla
May 8
Open the options list in your conversation with Victor del Rosal and Carlos Larracilla
You: Mi querido Carlos! Recibe un fuerte abrazo, recordando momentos tan gratos en el Tec. Muy feliz viernes desde el otro lado del charco. Fíjate que se me ocurrió que le hagamos un pequeño reconocimiento a a Rodolfo Bello. Si tienes oportunidad, podrías grabar tu video de aquí al lunes? https://reconocimiento.kluxy.app/r/rodolfo-bello/

Pavan Madduri
Pavan Madduri
May 5
Open the options list in your conversation with Victor del Rosal and Pavan Madduri
Pavan: Hi Victor, I believe we connected back when I achieved my Golden Kubestronaut designation. I’ve been following your work demystifying AI, and your focus on the business impact and compute optimization of these models really resonates with the challenges I'm tackling right now. I'm currently formalizing an infrastructure framework I call 'Agentic Ops'—focusing on bridging the gap between AI detection and autonomous infrastructure execution to solve GPU scalability bottlenecks. I recently published some of the foundational pieces for this, specifically around P2P distribution and the financial ROI of AI networks, and I immediately thought of your work: CNCF Blog (Dragonfly): https://www.cncf.io/blog/2026/04/06/peer-to-peer-acceleration-for-ai-model-distribution-with-dragonfly/ IEEE ComSoc (Financial Trap): https://techblog.comsoc.org/2026/03/30/the-financial-trap-of-autonomous-networks-scaling-agentic-ai-in-the-telecom-core/ Given your role as a Chief AI Officer and your past research on cloud compute optimization (like your AWS Spot Instances paper), I’d highly value your perspective. From a C-suite point of view, do you see these underlying execution and distribution bottlenecks as the primary barrier to AI ROI right now? I'd love to hear your thoughts async whenever you have a moment.

1
1 new notification
