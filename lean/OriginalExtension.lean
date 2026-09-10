import AKO26KnowledgeCollapse.MainTheorems
import Mathlib.Tactic.Positivity

/-!
# Original Extension: Positive Standalone Implementation Gain

This file is deliberately outside `PaperInterface.lean`.  It proves a small
extension motivated by the paper but not attributed to its Observation 1.

At zero public knowledge and zero effort, a strictly positive standalone
implementation gain `deltaI` gives a strictly positive marginal return to
effort whenever implementation precision and the signal density are positive.
Thus the zero-effort corner cannot satisfy a nonpositive marginal-return
condition in this extension.  Turning that local fact into a full dynamic
statement would require an explicit law of motion and is not claimed here.
-/

namespace AKO26KnowledgeCollapse

/-- Original extension, not a source-paper claim: a positive standalone gain
makes the marginal return at the zero corner strictly positive. -/
theorem positive_standalone_return_at_zero
    (deltaI lambdaI density : ℝ)
    (hdeltaI : 0 < deltaI)
    (hlambdaI : 0 < lambdaI)
    (hdensity : 0 < density) :
    0 < lambdaI * density * deltaI := by
  positivity

end AKO26KnowledgeCollapse
