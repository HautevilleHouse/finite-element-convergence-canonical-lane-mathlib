import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure AubinNitscheLemmaPackage where
  dualProblem : Type u
  regularityEstimate : Prop
  errorEstimateL2 : Prop
  dualityArgument : Prop

structure AubinNitscheLemmaEvidence (A : AubinNitscheLemmaPackage) where
  regularityEstimateClosed : A.regularityEstimate
  errorEstimateL2Closed : A.errorEstimateL2
  dualityArgumentClosed : A.dualityArgument

def AubinNitscheLemmaClosed (A : AubinNitscheLemmaPackage) : Prop :=
  A.regularityEstimate ∧ A.errorEstimateL2 ∧ A.dualityArgument

theorem aubin_nitsche_lemma_closed_from_evidence (A : AubinNitscheLemmaPackage) (E : AubinNitscheLemmaEvidence A) :
    AubinNitscheLemmaClosed A := by
  exact And.intro E.regularityEstimateClosed
    (And.intro E.errorEstimateL2Closed E.dualityArgumentClosed)

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse