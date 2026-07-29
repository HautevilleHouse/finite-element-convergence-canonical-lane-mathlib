import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.BRIDGE_Lemmas

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def gateClosed (A : FEAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : FEAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
