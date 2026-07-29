import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure FiniteElementConvergencePackage where
  meshRefinement : Prop
  solutionSpace : Type u
  discreteSolutionConverges : Prop
  orderOfConvergence : Prop
  asymptoticRegime : Prop

structure FiniteElementConvergenceEvidence (F : FiniteElementConvergencePackage) where
  meshRefinementClosed : F.meshRefinement
  discreteSolutionConvergesClosed : F.discreteSolutionConverges
  orderOfConvergenceClosed : F.orderOfConvergence
  asymptoticRegimeClosed : F.asymptoticRegime

def FiniteElementConvergenceClosed (F : FiniteElementConvergencePackage) : Prop :=
  F.meshRefinement ∧ F.discreteSolutionConverges ∧ F.orderOfConvergence ∧ F.asymptoticRegime

theorem finite_element_convergence_closed_from_evidence (F : FiniteElementConvergencePackage) (E : FiniteElementConvergenceEvidence F) :
    FiniteElementConvergenceClosed F := by
  exact And.intro E.meshRefinementClosed
    (And.intro E.discreteSolutionConvergesClosed
      (And.intro E.orderOfConvergenceClosed E.asymptoticRegimeClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse