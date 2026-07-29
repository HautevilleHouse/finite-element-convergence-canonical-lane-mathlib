import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure LinearAlgebraicSystemPackage where
  stiffnessMatrixPosDef : Prop
  loadVectorConsistent : Prop
  solverConvergence : Prop
  conditionNumberBound : Prop

structure LinearAlgebraicSystemEvidence (L : LinearAlgebraicSystemPackage) where
  stiffnessMatrixPosDefClosed : L.stiffnessMatrixPosDef
  loadVectorConsistentClosed : L.loadVectorConsistent
  solverConvergenceClosed : L.solverConvergence
  conditionNumberBoundClosed : L.conditionNumberBound

def LinearAlgebraicSystemClosed (L : LinearAlgebraicSystemPackage) : Prop :=
  L.stiffnessMatrixPosDef ∧ L.loadVectorConsistent ∧ L.solverConvergence ∧ L.conditionNumberBound

theorem linear_algebraic_system_closed_from_evidence (L : LinearAlgebraicSystemPackage) (E : LinearAlgebraicSystemEvidence L) : LinearAlgebraicSystemClosed L := by
  exact And.intro E.stiffnessMatrixPosDefClosed (And.intro E.loadVectorConsistentClosed (And.intro E.solverConvergenceClosed E.conditionNumberBoundClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse