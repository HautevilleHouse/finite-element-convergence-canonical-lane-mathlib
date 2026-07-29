import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure MeshQualityPackage where
  aspectRatioBound : Prop
  skewnessBound : Prop
  orthogonalityBound : Prop
  volumeGrowthControl : Prop

structure MeshQualityEvidence (M : MeshQualityPackage) where
  aspectRatioBoundClosed : M.aspectRatioBound
  skewnessBoundClosed : M.skewnessBound
  orthogonalityBoundClosed : M.orthogonalityBound
  volumeGrowthControlClosed : M.volumeGrowthControl

def MeshQualityClosed (M : MeshQualityPackage) : Prop :=
  M.aspectRatioBound ∧ M.skewnessBound ∧ M.orthogonalityBound ∧ M.volumeGrowthControl

theorem mesh_quality_closed_from_evidence (M : MeshQualityPackage) (E : MeshQualityEvidence M) : MeshQualityClosed M := by
  exact And.intro E.aspectRatioBoundClosed (And.intro E.skewnessBoundClosed (And.intro E.orthogonalityBoundClosed E.volumeGrowthControlClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse