import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure MarkovRenewalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MarkovRenewalAdmittedObject where
  space : MarkovRenewalSpace
  renewalProcessDefined : Prop
  semiMarkovProperty : Prop
  admissibleKernel : Type
  kernelTopology : TopologicalSpace admissibleKernel
  kernelClosed : Prop
  conclusion : kernelClosed

def MarkovRenewalWitnessClosed (O : MarkovRenewalAdmittedObject) : Prop :=
  O.kernelClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse