import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshGenerationPackage where
  conformingTetrahedralMesh : Type u
  localElementSize : Type v
  maximumElementDiameter : Prop
  shapeRegularityConstant : Prop
  meshFamilyIndexed : Prop

structure MeshGenerationEvidence (M : MeshGenerationPackage) where
  maximumElementDiameterClosed : M.maximumElementDiameter
  shapeRegularityConstantClosed : M.shapeRegularityConstant
  meshFamilyIndexedClosed : M.meshFamilyIndexed

def MeshGenerationClosed (M : MeshGenerationPackage) : Prop :=
  M.maximumElementDiameter ∧ M.shapeRegularityConstant ∧ M.meshFamilyIndexed

theorem mesh_generation_closed_from_evidence (M : MeshGenerationPackage) (E : MeshGenerationEvidence M) :
    MeshGenerationClosed M := by
  exact And.intro E.maximumElementDiameterClosed
    (And.intro E.shapeRegularityConstantClosed E.meshFamilyIndexedClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse