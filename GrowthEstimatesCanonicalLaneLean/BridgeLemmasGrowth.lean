import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GrowthEstimatesClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse