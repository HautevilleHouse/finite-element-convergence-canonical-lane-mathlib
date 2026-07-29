import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure AposterioriErrorEstimationPackage where
  residualEstimator : Prop
  recoveryEstimator : Prop
  hierarchicalEstimator : Prop
  efficiencyReliability : Prop

structure AposterioriErrorEstimationEvidence (A : AposterioriErrorEstimationPackage) where
  residualEstimatorClosed : A.residualEstimator
  recoveryEstimatorClosed : A.recoveryEstimator
  hierarchicalEstimatorClosed : A.hierarchicalEstimator
  efficiencyReliabilityClosed : A.efficiencyReliability

def AposterioriErrorEstimationClosed (A : AposterioriErrorEstimationPackage) : Prop :=
  A.residualEstimator ∧ A.recoveryEstimator ∧ A.hierarchicalEstimator ∧ A.efficiencyReliability

theorem aposteriori_error_estimation_closed_from_evidence (A : AposterioriErrorEstimationPackage) (E : AposterioriErrorEstimationEvidence A) : AposterioriErrorEstimationClosed A := by
  exact And.intro E.residualEstimatorClosed (And.intro E.recoveryEstimatorClosed (And.intro E.hierarchicalEstimatorClosed E.efficiencyReliabilityClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse