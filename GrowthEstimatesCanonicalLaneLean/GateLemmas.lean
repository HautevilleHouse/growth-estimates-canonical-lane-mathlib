import GrowthEstimatesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
