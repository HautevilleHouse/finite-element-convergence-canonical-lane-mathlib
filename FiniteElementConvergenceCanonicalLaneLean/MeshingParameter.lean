import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshingParameterPackage where
  meshFamily : Type u
  elementDiameter : meshFamily → ℝ
  shapeRegularity : meshFamily → Prop
  quasiUniformity : meshFamily → Prop

structure MeshingParameterEvidence (M : MeshingParameterPackage) where
  diameterPositive : ∀ m, M.elementDiameter m > 0
  shapeRegularityHolds : ∀ m, M.shapeRegularity m
  quasiUniformityHolds : ∀ m, M.quasiUniformity m

def MeshingParameterClosed (M : MeshingParameterPackage) : Prop :=
  (∀ m, M.elementDiameter m > 0) ∧ (∀ m, M.shapeRegularity m) ∧ (∀ m, M.quasiUniformity m)

theorem meshing_parameter_closed_from_evidence (M : MeshingParameterPackage) (E : MeshingParameterEvidence M) : MeshingParameterClosed M := by
  exact And.intro E.diameterPositive (And.intro E.shapeRegularityHolds E.quasiUniformityHolds)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse