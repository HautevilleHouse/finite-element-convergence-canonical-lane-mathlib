import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def ConstrainedFEMClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fem_endgame (A : AdmissibleClass) :
    ConstrainedFEMClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
