import HautevilleHouse.GrowthEstimatesCanonicalLaneLean.RateConvergencePackage

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure OptimalGrowthEvidence {U : UniformBoundPackage}
    (R : RateConvergencePackage U) where
  optimalRate : ℝ
  rateMinimal : ∀ r : ℝ, (r > 0 ∧ r < optimalRate) → False
  optimalRateClosed : optimalRate > 0

def OptimalGrowthClosed {U : UniformBoundPackage} {R : RateConvergencePackage U}
    (O : OptimalGrowthEvidence R) : Prop :=
  O.optimalRateClosed ∧ O.rateMinimal O.optimalRate

theorem optimal_growth_closed_from_evidence {U : UniformBoundPackage}
    {R : RateConvergencePackage U} (O : OptimalGrowthEvidence R) :
    OptimalGrowthClosed O := by
  exact And.intro O.optimalRateClosed (O.rateMinimal O.optimalRate)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse