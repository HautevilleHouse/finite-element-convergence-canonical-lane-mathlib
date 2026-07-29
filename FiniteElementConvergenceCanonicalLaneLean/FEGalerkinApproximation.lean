import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.FEAdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure GalerkinPackage (A : FEAdmissibleClass) where
  discreteSpace : FEFunctionSpace
  stiffnessMatrix : Prop
  loadVector : Prop
  discreteSolution : Prop
  galerkinOrthogonality : Prop

structure GalerkinEvidence (A : FEAdmissibleClass) (G : GalerkinPackage A) where
  stiffnessMatrixClosed : G.stiffnessMatrix
  loadVectorClosed : G.loadVector
  discreteSolutionClosed : G.discreteSolution
  galerkinOrthogonalityClosed : G.galerkinOrthogonality

def GalerkinClosed (A : FEAdmissibleClass) (G : GalerkinPackage A) : Prop :=
  G.stiffnessMatrix ∧ G.loadVector ∧ G.discreteSolution ∧ G.galerkinOrthogonality

theorem galerkin_closed_from_evidence (A : FEAdmissibleClass) (G : GalerkinPackage A)
    (E : GalerkinEvidence A G) : GalerkinClosed A G := by
  exact And.intro E.stiffnessMatrixClosed
    (And.intro E.loadVectorClosed
      (And.intro E.discreteSolutionClosed E.galerkinOrthogonalityClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
