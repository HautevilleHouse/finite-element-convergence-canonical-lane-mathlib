import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure VariationalFormulationPackage where
  bilinearForm : Type u
  linearForm : Type v
  coercivity : Prop
  continuity : Prop
  infSupCondition : Prop

structure VariationalFormulationEvidence (V : VariationalFormulationPackage) where
  coercivityClosed : V.coercivity
  continuityClosed : V.continuity
  infSupConditionClosed : V.infSupCondition

def VariationalFormulationClosed (V : VariationalFormulationPackage) : Prop :=
  V.coercivity ∧ V.continuity ∧ V.infSupCondition

theorem variational_formulation_closed_from_evidence (V : VariationalFormulationPackage) (E : VariationalFormulationEvidence V) : VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed (And.intro E.continuityClosed E.infSupConditionClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse