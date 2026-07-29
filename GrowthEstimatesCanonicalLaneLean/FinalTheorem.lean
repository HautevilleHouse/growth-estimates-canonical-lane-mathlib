import GrowthEstimatesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def ConstrainedGrowthEstimatesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_growth_estimates_endgame (A : AdmissibleClass) :
    ConstrainedGrowthEstimatesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
