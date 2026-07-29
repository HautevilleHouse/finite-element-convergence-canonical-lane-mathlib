import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure CeaLemmaPackage where
  bilinearFormCoercive : Prop
  bilinearFormBounded : Prop
  linearFunctionalBounded : Prop
  discreteSolution : Type u
  exactSolution : Type v
  errorEstimate : Prop

structure CeaLemmaEvidence (C : CeaLemmaPackage) where
  bilinearFormCoerciveClosed : C.bilinearFormCoercive
  bilinearFormBoundedClosed : C.bilinearFormBounded
  linearFunctionalBoundedClosed : C.linearFunctionalBounded
  errorEstimateClosed : C.errorEstimate

def CeaLemmaClosed (C : CeaLemmaPackage) : Prop :=
  C.bilinearFormCoercive ∧ C.bilinearFormBounded ∧ C.linearFunctionalBounded ∧ C.errorEstimate

theorem cea_lemma_closed_from_evidence (C : CeaLemmaPackage) (E : CeaLemmaEvidence C) :
    CeaLemmaClosed C := by
  exact And.intro E.bilinearFormCoerciveClosed
    (And.intro E.bilinearFormBoundedClosed
      (And.intro E.linearFunctionalBoundedClosed E.errorEstimateClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse