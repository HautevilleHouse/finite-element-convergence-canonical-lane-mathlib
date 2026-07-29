import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure AdaptiveMeshRefinementPackage where
  markingStrategy : Prop
  refinementRule : Prop
  dorflerMarking : Prop
  optimalConvergenceRate : Prop

structure AdaptiveMeshRefinementEvidence (A : AdaptiveMeshRefinementPackage) where
  markingStrategyClosed : A.markingStrategy
  refinementRuleClosed : A.refinementRule
  dorflerMarkingClosed : A.dorflerMarking
  optimalConvergenceRateClosed : A.optimalConvergenceRate

def AdaptiveMeshRefinementClosed (A : AdaptiveMeshRefinementPackage) : Prop :=
  A.markingStrategy ∧ A.refinementRule ∧ A.dorflerMarking ∧ A.optimalConvergenceRate

theorem adaptive_mesh_refinement_closed_from_evidence (A : AdaptiveMeshRefinementPackage) (E : AdaptiveMeshRefinementEvidence A) : AdaptiveMeshRefinementClosed A := by
  exact And.intro E.markingStrategyClosed (And.intro E.refinementRuleClosed (And.intro E.dorflerMarkingClosed E.optimalConvergenceRateClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse