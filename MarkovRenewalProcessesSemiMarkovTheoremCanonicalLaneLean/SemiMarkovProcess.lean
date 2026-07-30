import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure SemiMarkovProcess where
  stateSpace : Type u
  kernel : stateSpace → stateSpace → Prop
  renewalProperty : Prop
  ageDependence : Prop

def SemiMarkovProcessClosed (P : SemiMarkovProcess) : Prop :=
  P.renewalProperty ∧ P.ageDependence

structure MarkovRenewalProcess extends SemiMarkovProcess where
  markovRenewalProperty : Prop
  conclusion : markovRenewalProperty

def SemiMarkovTheoremClosed (M : MarkovRenewalProcess) : Prop :=
  SemiMarkovProcessClosed M.toSemiMarkovProcess ∧ M.markovRenewalProperty

theorem semi_markov_process_closed_from_evidence (P : SemiMarkovProcess)
    (h : P.renewalProperty ∧ P.ageDependence) : SemiMarkovProcessClosed P := h

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse