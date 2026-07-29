import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def ConstrainedFiniteElementClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_finite_element_endgame (A : AdmissibleClass) :
    ConstrainedFiniteElementClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
