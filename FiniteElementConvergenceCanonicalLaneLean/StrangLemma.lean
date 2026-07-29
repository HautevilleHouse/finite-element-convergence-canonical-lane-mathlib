import FiniteElementConvergenceCanonicalLaneLean.ConsistencyStability

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure StrangLemmaPackage {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} {C : ConsistencyStabilityPackage M A} where
  convergence : M.meshFamily → Prop
  errorEstimate : M.meshFamily → ℝ → Prop
  optimalOrder : Prop

structure StrangLemmaEvidence {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} {C : ConsistencyStabilityPackage M A} (S : StrangLemmaPackage M A C) where
  convergenceClosed : ∀ m, S.convergence m
  errorEstimateClosed : ∀ (m : M.meshFamily) (h : ℝ), S.errorEstimate m h
  optimalOrderClosed : S.optimalOrder

def StrangLemmaClosed {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} {C : ConsistencyStabilityPackage M A} (S : StrangLemmaPackage M A C) : Prop :=
  (∀ m, S.convergence m) ∧ (∀ m h, S.errorEstimate m h) ∧ S.optimalOrder

theorem strang_lemma_closed_from_evidence {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} {C : ConsistencyStabilityPackage M A} (S : StrangLemmaPackage M A C) (E : StrangLemmaEvidence S) : StrangLemmaClosed S := by
  exact And.intro E.convergenceClosed (And.intro E.errorEstimateClosed E.optimalOrderClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse