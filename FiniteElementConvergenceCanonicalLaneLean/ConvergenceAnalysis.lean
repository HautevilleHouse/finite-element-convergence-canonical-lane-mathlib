import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure ConvergenceAnalysisPackage {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} (V : VariationalFormulationPackage F) where
  aPrioriEstimate : Prop
  aPosterioriEstimate : Prop
  convergenceRate : ℝ
  optimality : Prop

structure ConvergenceAnalysisEvidence {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} {V : VariationalFormulationPackage F} (C : ConvergenceAnalysisPackage V) where
  aPrioriEstimateClosed : C.aPrioriEstimate
  aPosterioriEstimateClosed : C.aPosterioriEstimate
  optimalityClosed : C.optimality

def ConvergenceAnalysisClosed {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} {V : VariationalFormulationPackage F} (C : ConvergenceAnalysisPackage V) : Prop :=
  C.aPrioriEstimate ∧ C.aPosterioriEstimate ∧ C.optimality

theorem convergence_analysis_closed_from_evidence {M : MeshRefinementPackage} {F : FiniteElementSpacePackage M} {V : VariationalFormulationPackage F} (C : ConvergenceAnalysisPackage V) (E : ConvergenceAnalysisEvidence C) :
    ConvergenceAnalysisClosed C := by
  exact And.intro E.aPrioriEstimateClosed (And.intro E.aPosterioriEstimateClosed E.optimalityClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
