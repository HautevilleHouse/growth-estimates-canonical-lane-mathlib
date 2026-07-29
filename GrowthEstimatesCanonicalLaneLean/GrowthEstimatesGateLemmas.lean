import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesBridgeLemmas

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def gateClosed (A : GrowthEstimatesAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : GrowthEstimatesAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse