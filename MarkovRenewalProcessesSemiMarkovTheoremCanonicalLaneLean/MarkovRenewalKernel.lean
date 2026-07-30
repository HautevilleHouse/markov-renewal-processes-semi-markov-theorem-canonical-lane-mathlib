import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure MarkovRenewalKernel (S : Type) where
  stateSpace : Set S
  kernel : S → S → ℝ → ℝ
  renewalEquation : ∀ s t, kernel s t 0 = 0
  semigroupProperty : ∀ s t u a b, kernel s u (a + b) = ∫ x, kernel s t a * kernel t u b
  measurability : Prop

structure MarkovRenewalEvidence (K : MarkovRenewalKernel S) where
  kernelClosed : ∀ s t r, K.kernel s t r = 0 ↔ r < 0
  semigroupClosed : K.semigroupProperty
  measurabilityClosed : K.measurability

def MarkovRenewalKernelClosed (K : MarkovRenewalKernel S) : Prop :=
  K.semigroupProperty ∧ K.measurability

theorem markov_renewal_kernel_closed_from_evidence (K : MarkovRenewalKernel S) (E : MarkovRenewalEvidence K) :
    MarkovRenewalKernelClosed K := by
  exact And.intro E.semigroupClosed E.measurabilityClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse