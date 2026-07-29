import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure VariationalFormulationPackage where
  bilinearFormCoercive : Prop
  bilinearFormContinuous : Prop
  linearFormContinuous : Prop
  laxMilgramSolution : Prop

structure VariationalFormulationEvidence (V : VariationalFormulationPackage) where
  bilinearFormCoerciveClosed : V.bilinearFormCoercive
  bilinearFormContinuousClosed : V.bilinearFormContinuous
  linearFormContinuousClosed : V.linearFormContinuous
  laxMilgramSolutionClosed : V.laxMilgramSolution

def VariationalFormulationClosed (V : VariationalFormulationPackage) : Prop :=
  V.bilinearFormCoercive ∧ V.bilinearFormContinuous ∧ V.linearFormContinuous ∧ V.laxMilgramSolution

theorem variational_formulation_closed_from_evidence (V : VariationalFormulationPackage) (E : VariationalFormulationEvidence V) : VariationalFormulationClosed V := by
  exact And.intro E.bilinearFormCoerciveClosed (And.intro E.bilinearFormContinuousClosed (And.intro E.linearFormContinuousClosed E.laxMilgramSolutionClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse