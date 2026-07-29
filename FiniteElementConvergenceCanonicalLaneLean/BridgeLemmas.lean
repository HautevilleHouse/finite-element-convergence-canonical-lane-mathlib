import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FiniteElementWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
