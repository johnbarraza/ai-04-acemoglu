import AKO26KnowledgeCollapse.PaperInterface
import Mathlib.Tactic.Positivity

/-!
# Proof Interface: AI, Human Cognition and Knowledge Collapse

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace AKO26KnowledgeCollapse

/--
Lean proof endpoint for `observation1_public_complements_ai_substitutesSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem observation1_public_complements_ai_substitutes :
  observation1_public_complements_ai_substitutesSpec := by
  intro deltaI deltaX lambdaI sigmaInvSq effort publicPrecision agenticPrecision
    G g gPrime marginalEffortCost
  intro _hdeltaI hdeltaX hlambdaI _hpublic
  dsimp
  intro hG hg hGpos hgPublicPos hgIndividualPos hgPrimeNeg
  constructor
  · simpa [mul_assoc, mul_left_comm, mul_comm] using
      (((hG.const_mul deltaX).mul_const
        (lambdaI * g (sigmaInvSq + lambdaI * effort + agenticPrecision))).sub_const
          (marginalEffortCost effort))
  constructor
  · have hinner : HasDerivAt
        (fun tau : ℝ => sigmaInvSq + lambdaI * effort + tau) 1 agenticPrecision := by
      simpa only [id_eq] using
        (hasDerivAt_id agenticPrecision).const_add
          (sigmaInvSq + lambdaI * effort)
    have hcomp := hg.comp agenticPrecision hinner
    simpa [mul_assoc] using
      ((hcomp.const_mul (deltaX * G publicPrecision * lambdaI)).sub_const
        (marginalEffortCost effort))
  constructor
  · positivity
  · have hpositive : 0 < deltaX * G publicPrecision * lambdaI := by
      positivity
    exact mul_neg_of_pos_of_neg hpositive hgPrimeNeg

end AKO26KnowledgeCollapse
