import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.FEGalerkinApproximation

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ErrorEstimatePackage (A : FEAdmissibleClass) (G : GalerkinPackage A) where
  interpolationError : Prop
  aPrioriErrorBound : Prop
  aPosterioriErrorIndicator : Prop
  convergenceRate : Prop

structure ErrorEstimateEvidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) where
  interpolationErrorClosed : E.interpolationError
  aPrioriErrorBoundClosed : E.aPrioriErrorBound
  aPosterioriErrorIndicatorClosed : E.aPosterioriErrorIndicator
  convergenceRateClosed : E.convergenceRate

def ErrorEstimateClosed (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) : Prop :=
  E.interpolationError ∧ E.aPrioriErrorBound ∧ E.aPosterioriErrorIndicator ∧ E.convergenceRate

theorem error_estimate_closed_from_evidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (Ev : ErrorEstimateEvidence A G E) : ErrorEstimateClosed A G E := by
  exact And.intro Ev.interpolationErrorClosed
    (And.intro Ev.aPrioriErrorBoundClosed
      (And.intro Ev.aPosterioriErrorIndicatorClosed Ev.convergenceRateClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
