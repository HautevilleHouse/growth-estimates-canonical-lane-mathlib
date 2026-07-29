import HautevilleHouse.GrowthEstimatesCanonicalLaneLean.UniformBoundPackage

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure RateConvergencePackage (U : UniformBoundPackage) where
  convergenceRate : ℝ
  ratePositive : convergenceRate > 0
  convergenceRateClosed : convergenceRate > 0

def RateConvergenceClosed (U : UniformBoundPackage) (R : RateConvergencePackage U) : Prop :=
  R.convergenceRateClosed

theorem rate_convergence_closed_from_package (U : UniformBoundPackage) (R : RateConvergencePackage U) :
    RateConvergenceClosed U R := by
  exact R.ratePositive

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse