import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshRegularityPackage where
  meshFamily : Type u
  shapeRegularity : Prop
  quasiUniformity : Prop
  sizeFunctionReference : Prop
  shapeRegularityBound : ℕ → ℝ
  quasiUniformityConstant : ℕ → ℝ

structure MeshRegularityEvidence (M : MeshRegularityPackage) where
  shapeRegularityClosed : M.shapeRegularity
  quasiUniformityClosed : M.quasiUniformity
  sizeFunctionReferenceClosed : M.sizeFunctionReference

def MeshRegularityClosed (M : MeshRegularityPackage) : Prop :=
  M.shapeRegularity ∧ M.quasiUniformity ∧ M.sizeFunctionReference

theorem mesh_regularity_closed_from_evidence (M : MeshRegularityPackage)
    (E : MeshRegularityEvidence M) : MeshRegularityClosed M := by
  exact And.intro E.shapeRegularityClosed
    (And.intro E.quasiUniformityClosed E.sizeFunctionReferenceClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
