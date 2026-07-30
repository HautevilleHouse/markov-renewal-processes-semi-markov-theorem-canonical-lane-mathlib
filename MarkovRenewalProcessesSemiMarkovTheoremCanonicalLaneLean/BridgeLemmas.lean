import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovRenewalTheoremClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.proofStructureClosed

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse