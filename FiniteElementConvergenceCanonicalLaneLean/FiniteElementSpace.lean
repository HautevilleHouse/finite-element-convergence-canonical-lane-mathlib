import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure FiniteElementSpacePackage (M : MeshRefinementPackage) where
  polynomialDegree : ℕ
  localBasis : Type
  globalBasis : Type
  approximationProperty : Prop
  inverseEstimates : Prop

structure FiniteElementSpaceEvidence {M : MeshRefinementPackage} (F : FiniteElementSpacePackage M) where
  approximationPropertyClosed : F.approximationProperty
  inverseEstimatesClosed : F.inverseEstimates

def FiniteElementSpaceClosed {M : MeshRefinementPackage} (F : FiniteElementSpacePackage M) : Prop :=
  F.approximationProperty ∧ F.inverseEstimates

theorem finite_element_space_closed_from_evidence {M : MeshRefinementPackage} (F : FiniteElementSpacePackage M) (E : FiniteElementSpaceEvidence F) :
    FiniteElementSpaceClosed F := by
  exact And.intro E.approximationPropertyClosed E.inverseEstimatesClosed

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
