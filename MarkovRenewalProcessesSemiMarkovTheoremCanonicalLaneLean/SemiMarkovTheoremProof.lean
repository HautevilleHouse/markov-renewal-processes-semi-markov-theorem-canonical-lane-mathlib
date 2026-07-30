import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.MarkovRenewalKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure SemiMarkovTheoremPackage (K : MarkovRenewalKernel S) where
  transitionProbability : S → S → ℝ → ℝ
  embeddedChain : Prop
  sojournDistribution : S → ℝ → ℝ
  limitDistribution : Prop
  theoremStatement : Prop

structure SemiMarkovTheoremEvidence (K : MarkovRenewalKernel S) (P : SemiMarkovTheoremPackage K) where
  transitionClosed : ∀ s t r, P.transitionProbability s t r = K.kernel s t r
  embeddedChainClosed : P.embeddedChain
  sojournClosed : ∀ s r, P.sojournDistribution s r = ∫ t, K.kernel s t r
  limitDistributionClosed : P.limitDistribution
  theoremStatementClosed : P.theoremStatement

def SemiMarkovTheoremClosed (K : MarkovRenewalKernel S) (P : SemiMarkovTheoremPackage K) : Prop :=
  P.embeddedChain ∧ P.limitDistribution ∧ P.theoremStatement

theorem semi_markov_theorem_closed_from_evidence (K : MarkovRenewalKernel S) (P : SemiMarkovTheoremPackage K) (E : SemiMarkovTheoremEvidence K P) :
    SemiMarkovTheoremClosed K P := by
  exact And.intro E.embeddedChainClosed (And.intro E.limitDistributionClosed E.theoremStatementClosed)

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse