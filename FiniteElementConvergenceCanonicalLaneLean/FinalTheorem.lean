import FiniteElementConvergenceCanonicalLaneLean.GateLemmas


namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

/-!
Finite element convergence

Constrained admissible-class closure of the theorem.
Full formalization of the proof is future work.
-/
def constrained_theorem_closure : Prop :=
  ∀ (PDE : Elliptic), FEM solution u_h → u with ||u - u_h||_1 ≤ C h^k ||u||_{k+1}

theorem constrained_theorem_closure_true : constrained_theorem_closure := by
  sorry

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
