import FiniteElementConvergenceCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FEMWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
