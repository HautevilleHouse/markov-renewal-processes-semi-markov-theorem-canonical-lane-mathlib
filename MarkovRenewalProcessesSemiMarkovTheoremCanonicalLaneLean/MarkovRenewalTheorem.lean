import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean.LimitingBehavior

namespace HautevilleHouse
namespace MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean

structure MarkovRenewalTheoremPackage {K : SemiMarkovKernel}
    {R : RenewalEquationPackage K} (L : LimitingBehaviorPackage R) where
  semiMarkovTheoremStatement : Prop
  markovRenewalTheoremStatement : Prop
  keyInequalities : Prop
  proofStructure : Prop

structure MarkovRenewalTheoremEvidence {K : SemiMarkovKernel}
    {R : RenewalEquationPackage K} {L : LimitingBehaviorPackage R}
    (M : MarkovRenewalTheoremPackage L) where
  semiMarkovTheoremStatementClosed : M.semiMarkovTheoremStatement
  markovRenewalTheoremStatementClosed : M.markovRenewalTheoremStatement
  keyInequalitiesClosed : M.keyInequalities
  proofStructureClosed : M.proofStructure

def MarkovRenewalTheoremClosed {K : SemiMarkovKernel}
    {R : RenewalEquationPackage K} {L : LimitingBehaviorPackage R}
    (M : MarkovRenewalTheoremPackage L) : Prop :=
  M.semiMarkovTheoremStatement ∧ M.markovRenewalTheoremStatement ∧
  M.keyInequalities ∧ M.proofStructure

theorem markov_renewal_theorem_closed_from_evidence
    {K : SemiMarkovKernel} {R : RenewalEquationPackage K}
    {L : LimitingBehaviorPackage R} (M : MarkovRenewalTheoremPackage L)
    (E : MarkovRenewalTheoremEvidence M) : MarkovRenewalTheoremClosed M := by
  exact And.intro E.semiMarkovTheoremStatementClosed
    (And.intro E.markovRenewalTheoremStatementClosed
      (And.intro E.keyInequalitiesClosed E.proofStructureClosed))

end MarkovRenewalProcessesSemiMarkovTheoremCanonicalLaneLean
end HautevilleHouse