import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.GATE_Lemmas

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def ConstrainedFEClosure (A : FEAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fe_endgame (A : FEAdmissibleClass) :
    ConstrainedFEClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
