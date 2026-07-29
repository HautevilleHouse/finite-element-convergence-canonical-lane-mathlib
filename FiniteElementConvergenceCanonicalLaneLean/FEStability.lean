import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.FEMeshRefinement

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure StabilityPackage (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E) where
  infSupCondition : Prop
  coercivity : Prop
  continuity : Prop
  discreteStability : Prop

structure StabilityEvidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E)
    (S : StabilityPackage A G E M) where
  infSupConditionClosed : S.infSupCondition
  coercivityClosed : S.coercivity
  continuityClosed : S.continuity
  discreteStabilityClosed : S.discreteStability

def StabilityClosed (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E)
    (S : StabilityPackage A G E M) : Prop :=
  S.infSupCondition ∧ S.coercivity ∧ S.continuity ∧ S.discreteStability

theorem stability_closed_from_evidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : ErrorEstimatePackage A G) (M : MeshRefinementPackage A G E)
    (S : StabilityPackage A G E M) (Ev : StabilityEvidence A G E M S) :
    StabilityClosed A G E M S := by
  exact And.intro Ev.infSupConditionClosed
    (And.intro Ev.coercivityClosed
      (And.intro Ev.continuityClosed Ev.discreteStabilityClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
