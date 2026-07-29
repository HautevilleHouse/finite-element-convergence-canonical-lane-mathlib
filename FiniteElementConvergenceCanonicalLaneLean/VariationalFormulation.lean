import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure VariationalFormulationPackage {M : MeshRefinementPackage} (F : FiniteElementSpacePackage M) where
  bilinearForm : Type
  linearForm : Type
  coercivity : Prop
  continuity : Prop
  infSupStability : Prop

structure VariationalFormulationEvidence {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} (V : VariationalFormulationPackage F) where
  coercivityClosed : V.coercivity
  continuityClosed : V.continuity
  infSupStabilityClosed : V.infSupStability

def VariationalFormulationClosed {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} (V : VariationalFormulationPackage F) : Prop :=
  V.coercivity ∧ V.continuity ∧ V.infSupStability

theorem variational_formulation_closed_from_evidence {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} (V : VariationalFormulationPackage F) (E : VariationalFormulationEvidence V) :
    VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed (And.intro E.continuityClosed E.infSupStabilityClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
