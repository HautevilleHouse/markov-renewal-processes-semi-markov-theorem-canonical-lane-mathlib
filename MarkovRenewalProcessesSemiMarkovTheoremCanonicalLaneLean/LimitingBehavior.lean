import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.RenewalEquation

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure LimitingBehaviorPackage {K : SemiMarkovKernel}
    (R : RenewalEquationPackage K) where
  stationaryDistribution : Prop
  ergodicProperty : Prop
  limitTheorem : Prop
  mixingCondition : Prop
  convergenceRate : Prop

structure LimitingBehaviorEvidence {K : SemiMarkovKernel}
    {R : RenewalEquationPackage K} (L : LimitingBehaviorPackage R) where
  stationaryDistributionClosed : L.stationaryDistribution
  ergodicPropertyClosed : L.ergodicProperty
  limitTheoremClosed : L.limitTheorem
  mixingConditionClosed : L.mixingCondition
  convergenceRateClosed : L.convergenceRate

def LimitingBehaviorClosed {K : SemiMarkovKernel}
    {R : RenewalEquationPackage K} (L : LimitingBehaviorPackage R) : Prop :=
  L.stationaryDistribution ∧ L.ergodicProperty ∧
  L.limitTheorem ∧ L.mixingCondition ∧ L.convergenceRate

theorem limiting_behavior_closed_from_evidence
    {K : SemiMarkovKernel} {R : RenewalEquationPackage K}
    (L : LimitingBehaviorPackage R) (E : LimitingBehaviorEvidence L) :
    LimitingBehaviorClosed L := by
  exact And.intro E.stationaryDistributionClosed
    (And.intro E.ergodicPropertyClosed
      (And.intro E.limitTheoremClosed
        (And.intro E.mixingConditionClosed
          E.convergenceRateClosed)))

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse