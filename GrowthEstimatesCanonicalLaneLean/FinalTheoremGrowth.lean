import canonicalLaneMathlib.AdmissibleClass
import GrowthEstimatesCanonicalLaneLean.BridgeLemmasGrowth
import GrowthEstimatesCanonicalLaneLean.GateLemmasGrowth

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def ConstrainedGrowthClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_growth_endgame (A : AdmissibleClass) :
    ConstrainedGrowthClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse