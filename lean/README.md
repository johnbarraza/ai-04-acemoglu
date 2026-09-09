# Lean formalization status

Target: `AKO26KnowledgeCollapse` using Lean 4.30.0-rc2 and EconCSLib.

The intended source-facing scope is Observation 1, Observation 2, and
Propositions 1–2. The result with `Δ_I > 0` is an original extension and must
remain outside the paper-attributed theorem surface.

The complete generated EconCSLib folder will replace this status file after it
passes:

```bash
python3 scripts/paper_contribution.py check AKO26KnowledgeCollapse --fast
```

No successful validation is claimed in the current public snapshot.
