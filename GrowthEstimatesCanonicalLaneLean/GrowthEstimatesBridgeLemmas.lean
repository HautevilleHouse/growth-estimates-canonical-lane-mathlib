import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesAdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def bridgeClosed (A : GrowthEstimatesAdmissibleClass) : Prop :=
  let ob := A.object
  ob.estimateHolds ob.bound 0

theorem bridge_from_admissible_class (A : GrowthEstimatesAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.estimateHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse