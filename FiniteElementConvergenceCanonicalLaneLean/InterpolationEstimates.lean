import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure InterpolationEstimatesPackage where
  sobolevSpace : Type u
  polynomialDegree : ℕ
  elementDiameterH : ℝ
  interpolationConstant : ℝ
  estimateHolds : Prop

structure InterpolationEstimatesEvidence (I : InterpolationEstimatesPackage) where
  estimateHoldsClosed : I.estimateHolds

def InterpolationEstimatesClosed (I : InterpolationEstimatesPackage) : Prop :=
  I.estimateHolds

theorem interpolation_estimates_closed_from_evidence (I : InterpolationEstimatesPackage)
    (E : InterpolationEstimatesEvidence I) : InterpolationEstimatesClosed I := by
  exact E.estimateHoldsClosed

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
