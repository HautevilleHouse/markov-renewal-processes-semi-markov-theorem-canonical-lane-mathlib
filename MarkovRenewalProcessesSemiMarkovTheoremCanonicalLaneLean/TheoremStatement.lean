import MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure MarkovRenewalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MarkovRenewalAdmittedObject where
  space : MarkovRenewalSpace
  semiMarkovCondition : Prop
  renewalStructure : Prop
  limitTheorem : Prop
  conclusion : limitTheorem

def MarkovRenewalWitnessClosed (O : MarkovRenewalAdmittedObject) : Prop :=
  O.limitTheorem

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse