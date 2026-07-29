import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ApproximationRatePackage where
  sobolevExponent : ℕ
  brokenSeminormSemiH : ℝ
  errorBound : ℝ
  polynomialDegreeP : ℕ
  constantC : ℝ
  rateInequality : Prop

structure ApproximationRateEvidence (A : ApproximationRatePackage) where
  rateInequalityClosed : A.rateInequality

def ApproximationRateClosed (A : ApproximationRatePackage) : Prop :=
  A.rateInequality

theorem approximation_rate_closed_from_evidence (A : ApproximationRatePackage)
    (E : ApproximationRateEvidence A) : ApproximationRateClosed A := by
  exact E.rateInequalityClosed

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
