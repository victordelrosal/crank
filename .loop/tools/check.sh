#!/bin/bash
# Crank mechanical gate for the crank repo itself (distilled 2026-07-04 per the
# "distill tools, not only rules" doctrine). Run before spawning any cold verifier.
# Scope: AUTHORED artifacts only. Verbatim source captures (raw page grabs in research/)
# may quote em dashes from the original; the style law governs what we write, not what
# we quote. Authored set below.
set -u
FAIL=0
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
INSTALLED="$HOME/.claude/skills/crank/SKILL.md"
AUTHORED=("$INSTALLED" "$REPO/skill/SKILL.md" "$REPO/README.md"
  "$REPO/research/clineflow-uriostegui.md" "$REPO/research/loop-benchmark-2026-07.md"
  "$REPO/research/loop-engineering-14-step-codez.md"
  "$REPO/research/graph-engineering-2026-07.md" "$REPO/.loop/DELTA-2026-07-27.md"
  "$REPO/research/knowledge-graph-playbook-anthropic-2026-07.md"
  "$REPO/.loop/BRIEF.md" "$REPO/.loop/CRITERIA.md" "$REPO/.loop/LOG.md")
for f in "${AUTHORED[@]}"; do
  [ -f "$f" ] || continue
  n=$(grep -c $'\xe2\x80\x94' "$f"); n=${n:-0}
  if [ "$n" -gt 0 ]; then echo "FAIL em-dash x$n: $f"; FAIL=1; fi
done
cmp -s "$INSTALLED" "$REPO/skill/SKILL.md" || { echo "FAIL sync: installed vs repo differ"; FAIL=1; }
for s in "Ground before you frame" "Baseline before you improve" "evaluation surface is frozen" "verifier drives the artifact" "fork the bet" "Distill tools, not only rules" "The director's log" \
  "The fake-edge test" "node contract" "hidden edges" "fan-in guard" "Anchors: topology does not buy truth" "Graph-fitness check" "which one owns the failure" "Reach for Workflow when the topology is real" "layered fan-in" \
  "One word, two disciplines" "The verifier is read-only" "Every rule carries its evidence and its date" "The global file is an index, not a journal" "Retire rules into tools" "One raw sample"; do
  grep -q "$s" "$INSTALLED" || { echo "FAIL missing: $s"; FAIL=1; }
done
if [ "$FAIL" = "0" ]; then echo "GATE PASS"; else echo "GATE FAIL"; fi
exit $FAIL
