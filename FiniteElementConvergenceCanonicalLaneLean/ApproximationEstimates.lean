import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ApproximationEstimatesPackage where
  ceaEstimate : Prop
  interpolationEstimate : Prop
  inverseEstimate : Prop
  aubinNitscheDuality : Prop

structure ApproximationEstimatesEvidence (A : ApproximationEstimatesPackage) where
  ceaEstimateClosed : A.ceaEstimate
  interpolationEstimateClosed : A.interpolationEstimate
  inverseEstimateClosed : A.inverseEstimate
  aubinNitscheDualityClosed : A.aubinNitscheDuality

def ApproximationEstimatesClosed (A : ApproximationEstimatesPackage) : Prop :=
  A.ceaEstimate ∧ A.interpolationEstimate ∧ A.inverseEstimate ∧ A.aubinNitscheDuality

theorem approximation_estimates_closed_from_evidence (A : ApproximationEstimatesPackage) (E : ApproximationEstimatesEvidence A) : ApproximationEstimatesClosed A := by
  exact And.intro E.ceaEstimateClosed (And.intro E.interpolationEstimateClosed (And.intro E.inverseEstimateClosed E.aubinNitscheDualityClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse