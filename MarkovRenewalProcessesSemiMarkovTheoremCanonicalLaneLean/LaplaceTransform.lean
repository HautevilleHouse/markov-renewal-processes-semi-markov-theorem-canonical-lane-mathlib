import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.SemiMarkovKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure LaplaceTransformPackage {S : SemiMarkovKernelPackage} where
  transformDomain : Type u
  kernelTransform : S.stateSpace → S.stateSpace → transformDomain → ℂ
  inversionFormula : Prop

structure LaplaceTransformEvidence {S : SemiMarkovKernelPackage}
    (L : LaplaceTransformPackage S) where
  inversionFormulaClosed : L.inversionFormula

def LaplaceTransformClosed {S : SemiMarkovKernelPackage}
    (L : LaplaceTransformPackage S) : Prop :=
  L.inversionFormula

theorem laplace_transform_closed_from_evidence {S : SemiMarkovKernelPackage}
    (L : LaplaceTransformPackage S) (E : LaplaceTransformEvidence L) :
    LaplaceTransformClosed L := by
  exact E.inversionFormulaClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse
