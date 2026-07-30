import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.SemiMarkovKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure EmbeddedChainPackage {S : SemiMarkovKernelPackage} where
  transitionMatrix : S.stateSpace → S.stateSpace → ℝ
  irreducible : Prop
  stationaryDistribution : S.stateSpace → ℝ

structure EmbeddedChainEvidence {S : SemiMarkovKernelPackage}
    (E : EmbeddedChainPackage S) where
  irreducibleClosed : E.irreducible
  stationaryDistributionClosed : ∀ x : S.stateSpace, E.stationaryDistribution x ≥ 0

def EmbeddedChainClosed {S : SemiMarkovKernelPackage}
    (E : EmbeddedChainPackage S) : Prop :=
  E.irreducible ∧ (∀ x : S.stateSpace, E.stationaryDistribution x ≥ 0)

theorem embedded_chain_closed_from_evidence {S : SemiMarkovKernelPackage}
    (E : EmbeddedChainPackage S) (Ev : EmbeddedChainEvidence E) :
    EmbeddedChainClosed E := by
  exact And.intro Ev.irreducibleClosed Ev.stationaryDistributionClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse
