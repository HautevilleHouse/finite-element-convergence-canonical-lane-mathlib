import FiniteElementConvergenceCanonicalLaneLean.MeshingParameter

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ApproximationEstimatesPackage {M : MeshingParameterPackage} where
  interpolationError : M.meshFamily → ℝ → Prop
  bestApproximation : M.meshFamily → ℝ → Prop
  aubinNitscheDuality : Prop

structure ApproximationEstimatesEvidence {M : MeshingParameterPackage} (A : ApproximationEstimatesPackage M) where
  interpolationErrorBound : ∀ (m : M.meshFamily) (h : ℝ), A.interpolationError m h
  bestApproximationBound : ∀ (m : M.meshFamily) (h : ℝ), A.bestApproximation m h
  aubinNitscheDualityClosed : A.aubinNitscheDuality

def ApproximationEstimatesClosed {M : MeshingParameterPackage} (A : ApproximationEstimatesPackage M) : Prop :=
  (∀ m h, A.interpolationError m h) ∧ (∀ m h, A.bestApproximation m h) ∧ A.aubinNitscheDuality

theorem approximation_estimates_closed_from_evidence {M : MeshingParameterPackage} (A : ApproximationEstimatesPackage M) (E : ApproximationEstimatesEvidence A) : ApproximationEstimatesClosed A := by
  exact And.intro E.interpolationErrorBound (And.intro E.bestApproximationBound E.aubinNitscheDualityClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse