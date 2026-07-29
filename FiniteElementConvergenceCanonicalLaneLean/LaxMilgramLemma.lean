import FiniteElementConvergenceCanonicalLaneLean.VariationalFormulation

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure LaxMilgramLemmaPackage {V : VariationalFormulationPackage} where
  solutionExistence : Prop
  solutionUniqueness : Prop
  stabilityEstimate : Prop

structure LaxMilgramLemmaEvidence {V : VariationalFormulationPackage} (L : LaxMilgramLemmaPackage V) where
  solutionExistenceClosed : L.solutionExistence
  solutionUniquenessClosed : L.solutionUniqueness
  stabilityEstimateClosed : L.stabilityEstimate

def LaxMilgramLemmaClosed {V : VariationalFormulationPackage} (L : LaxMilgramLemmaPackage V) : Prop :=
  L.solutionExistence ∧ L.solutionUniqueness ∧ L.stabilityEstimate

theorem lax_milgram_lemma_closed_from_evidence {V : VariationalFormulationPackage} (L : LaxMilgramLemmaPackage V) (E : LaxMilgramLemmaEvidence L) : LaxMilgramLemmaClosed L := by
  exact And.intro E.solutionExistenceClosed (And.intro E.solutionUniquenessClosed E.stabilityEstimateClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse