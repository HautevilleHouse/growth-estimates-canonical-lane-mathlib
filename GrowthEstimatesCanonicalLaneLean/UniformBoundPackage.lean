import HautevilleHouse.GrowthEstimatesCanonicalLaneLean.GrowthEstimatesAdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure UniformBoundPackage where
  supBound : ℝ
  uniformBound : Prop
  boundHolds : supBound < ∞
  uniformBoundClosed : uniformBound

def UniformBoundClosed (U : UniformBoundPackage) : Prop :=
  U.uniformBound ∧ U.boundHolds

theorem uniform_bound_closed_from_package (U : UniformBoundPackage) :
    UniformBoundClosed U := by
  exact And.intro U.uniformBoundClosed U.boundHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse