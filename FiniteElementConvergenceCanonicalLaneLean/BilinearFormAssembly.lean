import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteElementConvergenceCanonicalLaneLean

structure BilinearFormAssemblyPackage where
  stiffnessMatrix : Type u
  massMatrix : Type v
  loadVector : Type w
  quadratureRule : Type x
  assemblyProcedure : Prop

structure BilinearFormAssemblyEvidence (B : BilinearFormAssemblyPackage) where
  stiffnessMatrixClosed : Nonempty B.stiffnessMatrix
  massMatrixClosed : Nonempty B.massMatrix
  loadVectorClosed : Nonempty B.loadVector
  assemblyProcedureClosed : B.assemblyProcedure

def BilinearFormAssemblyClosed (B : BilinearFormAssemblyPackage) : Prop :=
  Nonempty B.stiffnessMatrix ∧ Nonempty B.massMatrix ∧ Nonempty B.loadVector ∧ B.assemblyProcedure

theorem bilinear_form_assembly_closed_from_evidence (B : BilinearFormAssemblyPackage) (E : BilinearFormAssemblyEvidence B) :
    BilinearFormAssemblyClosed B := by
  exact And.intro E.stiffnessMatrixClosed
    (And.intro E.massMatrixClosed
      (And.intro E.loadVectorClosed E.assemblyProcedureClosed))

end FiniteElementConvergenceCanonicalLaneLean
end HautevilleHouse