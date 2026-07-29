import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure SobolevSpaceEmbeddingsPackage where
  poincareInequality : Prop
  sobolevInequality : Prop
  compactEmbedding : Prop
  traceTheorem : Prop

structure SobolevSpaceEmbeddingsEvidence (S : SobolevSpaceEmbeddingsPackage) where
  poincareInequalityClosed : S.poincareInequality
  sobolevInequalityClosed : S.sobolevInequality
  compactEmbeddingClosed : S.compactEmbedding
  traceTheoremClosed : S.traceTheorem

def SobolevSpaceEmbeddingsClosed (S : SobolevSpaceEmbeddingsPackage) : Prop :=
  S.poincareInequality ∧ S.sobolevInequality ∧ S.compactEmbedding ∧ S.traceTheorem

theorem sobolev_space_embeddings_closed_from_evidence (S : SobolevSpaceEmbeddingsPackage) (E : SobolevSpaceEmbeddingsEvidence S) : SobolevSpaceEmbeddingsClosed S := by
  exact And.intro E.poincareInequalityClosed (And.intro E.sobolevInequalityClosed (And.intro E.compactEmbeddingClosed E.traceTheoremClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse