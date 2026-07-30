import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.SemiMarkovKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure SojournTimePackage {S : SemiMarkovKernelPackage} where
  distribution : S.stateSpace → S.timeSpace → ℝ
  meanSojourn : S.stateSpace → ℝ
  finiteMeanSojourn : Prop

structure SojournTimeEvidence {S : SemiMarkovKernelPackage}
    (T : SojournTimePackage S) where
  finiteMeanSojournClosed : T.finiteMeanSojourn

def SojournTimeClosed {S : SemiMarkovKernelPackage}
    (T : SojournTimePackage S) : Prop :=
  T.finiteMeanSojourn

theorem sojourn_time_closed_from_evidence {S : SemiMarkovKernelPackage}
    (T : SojournTimePackage S) (E : SojournTimeEvidence T) :
    SojournTimeClosed T := by
  exact E.finiteMeanSojournClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse
