import GrowthEstimatesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure AdmissibleClass where
  object : GrowthEstimatesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GrowthEstimatesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
