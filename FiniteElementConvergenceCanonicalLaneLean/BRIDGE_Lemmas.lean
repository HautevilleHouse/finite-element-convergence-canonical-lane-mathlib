import HautevilleHouse.FiniteElementConvergenceCanonicalLaneLean.FEAdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

def bridgeClosed (A : FEAdmissibleClass) : Prop :=
  FEWitnessClosed A.object

theorem bridge_from_admissible_class (A : FEAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse
