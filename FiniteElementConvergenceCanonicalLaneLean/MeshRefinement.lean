import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshRefinementPackage where
  initialMesh : Type
  refinedMesh : Type
  refinementRatio : ℝ
  shapeRegularity : Prop
  quasiUniformity : Prop

structure MeshRefinementEvidence (M : MeshRefinementPackage) where
  shapeRegularityClosed : M.shapeRegularity
  quasiUniformityClosed : M.quasiUniformity

def MeshRefinementClosed (M : MeshRefinementPackage) : Prop :=
  M.shapeRegularity ∧ M.quasiUniformity

theorem mesh_refinement_closed_from_evidence (M : MeshRefinementPackage) (E : MeshRefinementEvidence M) :
    MeshRefinementClosed M := by
  exact And.intro E.shapeRegularityClosed E.quasiUniformityClosed

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
