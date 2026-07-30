import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure SemiMarkovKernel (S : Type) where
  holdingTimes : S → S → ℝ
  transitionProb : S → S → ℝ
  kernelNonneg : ∀ i j, 0 ≤ holdingTimes i j ∧ 0 ≤ transitionProb i j
  totalProb : ∀ i, ∑' j, transitionProb i j = 1
  finiteSupport : ∀ i, Set.Finite {j | transitionProb i j ≠ 0}

structure SemiMarkovKernelEvidence (S : Type) (K : SemiMarkovKernel S) where
  kernelNonnegClosed : K.kernelNonneg = (λ i j => (0 ≤ K.holdingTimes i j ∧ 0 ≤ K.transitionProb i j))
  totalProbClosed : K.totalProb = (λ i => ∑' j, K.transitionProb i j = 1)

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse