import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure MarkovRenewalProcess where
  stateSpace : Type u
  sojournDistribution : stateSpace -> stateSpace -> Type v
  transitionKernel : stateSpace -> stateSpace -> Type w
  markovRenewalProperty : Prop
  semiMarkovProperty : Prop

structure MarkovRenewalProcessEvidence (P : MarkovRenewalProcess) where
  markovRenewalPropertyClosed : P.markovRenewalProperty
  semiMarkovPropertyClosed : P.semiMarkovProperty

def MarkovRenewalProcessClosed (P : MarkovRenewalProcess) : Prop :=
  P.markovRenewalProperty ∧ P.semiMarkovProperty

theorem markov_renewal_process_closed_from_evidence (P : MarkovRenewalProcess)
    (E : MarkovRenewalProcessEvidence P) : MarkovRenewalProcessClosed P := by
  exact And.intro E.markovRenewalPropertyClosed E.semiMarkovPropertyClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse