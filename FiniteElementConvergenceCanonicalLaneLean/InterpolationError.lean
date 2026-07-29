import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure InterpolationErrorPackage where
  sobolevSpace : Type u
  interpolationOperator : Type v
  approximationEstimate : Prop
  regularityAssumption : Prop
  meshDependence : Prop

structure InterpolationErrorEvidence (I : InterpolationErrorPackage) where
  approximationEstimateClosed : I.approximationEstimate
  regularityAssumptionClosed : I.regularityAssumption
  meshDependenceClosed : I.meshDependence

def InterpolationErrorClosed (I : InterpolationErrorPackage) : Prop :=
  I.approximationEstimate ∧ I.regularityAssumption ∧ I.meshDependence

theorem interpolation_error_closed_from_evidence (I : InterpolationErrorPackage) (E : InterpolationErrorEvidence I) :
    InterpolationErrorClosed I := by
  exact And.intro E.approximationEstimateClosed
    (And.intro E.regularityAssumptionClosed E.meshDependenceClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse