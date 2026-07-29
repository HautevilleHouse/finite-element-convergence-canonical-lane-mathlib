import FiniteElementConvergenceCanonicalLaneLean.ApproximationEstimates

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ConsistencyStabilityPackage {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} where
  consistency : M.meshFamily → Prop
  stability : M.meshFamily → Prop
  laxEquivalence : Prop

structure ConsistencyStabilityEvidence {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} (C : ConsistencyStabilityPackage M A) where
  consistencyClosed : ∀ m, C.consistency m
  stabilityClosed : ∀ m, C.stability m
  laxEquivalenceClosed : C.laxEquivalence

def ConsistencyStabilityClosed {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} (C : ConsistencyStabilityPackage M A) : Prop :=
  (∀ m, C.consistency m) ∧ (∀ m, C.stability m) ∧ C.laxEquivalence

theorem consistency_stability_closed_from_evidence {M : MeshingParameterPackage} {A : ApproximationEstimatesPackage M} (C : ConsistencyStabilityPackage M A) (E : ConsistencyStabilityEvidence C) : ConsistencyStabilityClosed C := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed E.laxEquivalenceClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse