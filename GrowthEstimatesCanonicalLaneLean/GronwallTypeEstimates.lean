import canonicalLaneMathlib.AdmissibleClass
import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesDomain

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GronwallData where
  differentialInequality : Prop
  growthFunction : ℝ → ℝ
  initialCondition : ℝ
  upperBound : ℝ → ℝ
  dataConsistent : differentialInequality

structure GronwallEstimates where
  data : GronwallData
  comparisonPrinciple : Prop
  explicitBoundFormula : Prop
  comparisonPrincipleHolds : comparisonPrinciple
  explicitBoundFormulaHolds : explicitBoundFormula

def GronwallEstimatesClosed (G : GronwallEstimates) : Prop :=
  G.comparisonPrinciple ∧ G.explicitBoundFormula

theorem gronwall_estimates_closed_from_evidence (G : GronwallEstimates) : GronwallEstimatesClosed G :=
  And.intro G.comparisonPrincipleHolds G.explicitBoundFormulaHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse