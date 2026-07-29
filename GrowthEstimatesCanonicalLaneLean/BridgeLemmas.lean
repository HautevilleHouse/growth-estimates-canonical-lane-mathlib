import GrowthEstimatesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GrowthEstimatesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
