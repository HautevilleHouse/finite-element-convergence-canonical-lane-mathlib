import FiniteElementConvergenceCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure AdmissibleClass where
  object : FEMAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FEMWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
