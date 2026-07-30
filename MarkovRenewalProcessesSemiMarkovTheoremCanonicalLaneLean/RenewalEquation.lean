import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.SemiMarkovKernel

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure RenewalEquation (S : Type) (K : SemiMarkovKernel S) where
  renewalFunction : ℝ → S → ℝ
  satisfiesEquation : ∀ t, ∀ i, renewalFunction t i = 
    (if t < 0 then 0 else 1 + ∑' j, ∫ s in 0..t, renewalFunction (t - s) j * K.holdingTimes i j)
  measureZero : ∀ i, renewalFunction 0 i = 1

structure RenewalEquationEvidence (S : Type) (K : SemiMarkovKernel S) 
  (R : RenewalEquation S K) where
  satisfiesEquationClosed : R.satisfiesEquation = (∀ t, ∀ i, R.renewalFunction t i = 
    (if t < 0 then 0 else 1 + ∑' j, ∫ s in 0..t, R.renewalFunction (t - s) j * K.holdingTimes i j))
  measureZeroClosed : R.measureZero = (∀ i, R.renewalFunction 0 i = 1)

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse