import AKO26KnowledgeCollapse.MainTheorems
import AKO26KnowledgeCollapse.Assumptions

/-!
# Human-Facing Paper Interface: AI, Human Cognition and Knowledge Collapse

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `EconCSLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`; its temporary
  proof body may be `by sorry` only in a private draft. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus recursive
  premise/conclusion provenance on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, replace the `ProofInterface.lean` `sorry` with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

- `observation1_public_complements_ai_substitutesSpec` -> `observation1_public_complements_ai_substitutes`: Observation 1, Section 3.4, pp. 13–14, Observation 1 and displayed derivatives.
-/

namespace AKO26KnowledgeCollapse

/--
Observation 1

Paper statement: Under Assumption 1 (Δ_I = 0 and Δ_X > 0), public precision X_t complements human effort while agentic-AI precision τ_A substitutes for human effort: ∂²U/(∂e∂X_t) = Δ_X λ_I g(X_t)g(Y_i,t) > 0 and ∂²U/(∂e∂τ_A) = Δ_X G(X_t)λ_I g′(Y_i,t) < 0, for the interior domain X_t > 0.

Source location: Section 3.4, pp. 13–14, Observation 1 and displayed derivatives
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def observation1_public_complements_ai_substitutesSpec : Prop :=
  ∀ (deltaI deltaX lambdaI sigmaInvSq effort publicPrecision agenticPrecision : ℝ)
      (G g gPrime marginalEffortCost : ℝ → ℝ),
    deltaI = 0 →
    0 < deltaX →
    0 < lambdaI →
    0 < publicPrecision →
    let individualPrecision := sigmaInvSq + lambdaI * effort + agenticPrecision
    HasDerivAt G (g publicPrecision) publicPrecision →
    HasDerivAt g (gPrime individualPrecision) individualPrecision →
    0 < G publicPrecision →
    0 < g publicPrecision →
    0 < g individualPrecision →
    gPrime individualPrecision < 0 →
    let marginalUtility := fun (X tau : ℝ) =>
      deltaX * G X * lambdaI * g (sigmaInvSq + lambdaI * effort + tau) -
        marginalEffortCost effort
    HasDerivAt (fun X => marginalUtility X agenticPrecision)
        (deltaX * lambdaI * g publicPrecision * g individualPrecision)
        publicPrecision ∧
      HasDerivAt (fun tau => marginalUtility publicPrecision tau)
        (deltaX * G publicPrecision * lambdaI * gPrime individualPrecision)
        agenticPrecision ∧
      0 < deltaX * lambdaI * g publicPrecision * g individualPrecision ∧
      deltaX * G publicPrecision * lambdaI * gPrime individualPrecision < 0

end AKO26KnowledgeCollapse
