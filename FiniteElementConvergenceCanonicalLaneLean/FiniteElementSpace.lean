import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure FiniteElementSpacePackage where
  referenceElement : Type u
  polynomialDegree : Nat
  nodalBasis : Type v
  transformationToPhysical : Type w
  conformity : String

structure FiniteElementSpaceEvidence (F : FiniteElementSpacePackage) where
  polynomialDegreeClosed : F.polynomialDegree ≥ 1
  nodalBasisClosed : Nonempty F.nodalBasis
  transformationToPhysicalClosed : Nonempty F.transformationToPhysical

def FiniteElementSpaceClosed (F : FiniteElementSpacePackage) : Prop :=
  F.polynomialDegree ≥ 1 ∧ Nonempty F.nodalBasis ∧ Nonempty F.transformationToPhysical

theorem finite_element_space_closed_from_evidence (F : FiniteElementSpacePackage) (E : FiniteElementSpaceEvidence F) :
    FiniteElementSpaceClosed F := by
  exact And.intro E.polynomialDegreeClosed
    (And.intro E.nodalBasisClosed E.transformationToPhysicalClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse