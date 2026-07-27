# BRIEF: Crank run 4 (2026-07-27, evening)

WHAT:         The decision, and any resulting changes, on what Crank must absorb from
              "The Knowledge Graph Playbook for Agentic Systems" (Anthropic-sourced synthesis,
              July 2026, now at research/knowledge-graph-playbook-anthropic-2026-07.pdf).
              Deliverables: a research capture with covers/lacks; the adopted deltas in
              skill/SKILL.md; the check.sh gate extended; LEARNINGS updated; README aligned.

WHY:          Victor asked "do we need, should we make changes to crank?" and named the panel.
              The underlying goal is not to absorb a document; it is to keep Crank honest about
              which mechanisms it genuinely needs and which are ceremony. Run 3 (this morning)
              absorbed eleven deltas from the topology sources. A fourth round the same day that
              bolts on a knowledge graph because a paper described one would be exactly the
              volume-as-proxy-for-value anti-pattern Crank names. The valuable answer may be
              mostly "no", and it has to be argued, not asserted.

WHO:          Crank's own operators: Victor, and any agent that loads skill/SKILL.md. Secondary:
              readers of the public README at victordelrosal.com/crank/.

CRITERIA:     See CRITERIA.md (C1 to C12).

PRD:          no. Instruction-artifact work; BRIEF + CRITERIA is the contract.

FLEET:        4 agents.
              - THEO (opus, drive) principal engineer: mechanism audit. Which playbook
                mechanisms are already in SKILL.md under another name, which are genuinely
                absent, which are absent and should stay absent. Owns C3, C4.
              - LARS (opus, drive) professor: the taxonomy and the sourcing. The "graph"
                naming collision, the document's provenance and reliability, what may be
                stated as fact vs attributed. Owns C2, C5.
              - MYTHOS (opus, drive) frontier mind: the deep call. Does a 3-to-5-agent,
                3-to-5-round loop need a memory layer at all, and what is the non-obvious
                move on Crank's own LEARNINGS files. Owns C6, C7.
              - VERIFIER (opus, drive) cold, fresh, sees CRITERIA.md + artifacts only, told
                to fail the work. Owns the stop.
              Director (Claudus, session, opus) integrates and writes the changes.

EDGES:        Real edge: panel (Theo, Lars, Mythos) -> director integration -> gate script ->
              cold verify. The three panellists have NO edge between them (none consumes
              another's output); they run at once. Hidden-edge audit: all three READ the same
              files and NONE writes; the director is the only writer. No worktree needed.

LOOP BUDGET:  2 rounds. This is a bounded delta on a skill that was just rewritten; the risk
              here is over-adding, not under-adding, and extra rounds bias toward adding.

EXIT:         The verdict on "do we need changes" is argued from the document and from Crank's
              actual text, every adopted delta is in SKILL.md and greppable by the gate, every
              rejected mechanism has a written rationale, and the gate passes.

DOWNGRADES:   C10 (README) may be relaxed to a pointer if the README's existing topology
              section already carries the distinction. Nothing else may be relaxed.

BUDGET CEILING: n/a, interactive, flat-rate.
