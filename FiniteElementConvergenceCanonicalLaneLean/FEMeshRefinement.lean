import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.FEAErrorEstimates

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshRefinementPackage (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) where
  refinementStrategy : Prop
  errorReduction : Prop
  meshRegularityPreserved : Prop
  optimalComplexity : Prop

structure MeshRefinementEvidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E) where
  refinementStrategyClosed : M.refinementStrategy
  errorReductionClosed : M.errorReduction
  meshRegularityPreservedClosed : M.meshRegularityPreserved
  optimalComplexityClosed : M.optimalComplexity

def MeshRefinementClosed (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E) : Prop :=
  M.refinementStrategy ∧ M.errorReduction ∧ M.meshRegularityPreserved ∧ M.optimalComplexity

theorem mesh_refinement_closed_from_evidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E)
    (Ev : MeshRefinementEvidence A G E M) : MeshRefinementClosed A G E M := by
  exact And.intro Ev.refinementStrategyClosed
    (And.intro Ev.errorReductionClosed
      (And.intro Ev.meshRegularityPreservedClosed Ev.optimalComplexityClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
