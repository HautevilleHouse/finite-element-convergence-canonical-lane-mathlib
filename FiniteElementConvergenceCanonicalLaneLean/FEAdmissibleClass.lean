import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure FEMesh where
  elements : List Type
  connectivity : Prop
  h_max : Float

structure FEFunctionSpace where
  basisFunctions : List (Type → Type)
  polynomialDegree : Nat
  continuity : Prop

structure FEAdmittedObject where
  mesh : FEMesh
  functionSpace : FEFunctionSpace
  bilinearForm : Prop
  linearForm : Prop
  solutionExistence : Prop
  aPrioriEstimate : Prop
  conclusion : solutionExistence ∧ aPrioriEstimate

structure FEAdmissibleClass where
  object : FEAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : FEAdmissibleClass) : Prop :=
  FEWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
