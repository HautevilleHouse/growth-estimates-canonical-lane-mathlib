import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthAdmittedObject where
  functionSpace : Type
  norm : functionSpace → ℝ
  growthEstimate : ℝ → ℝ → Prop
  bound : ℝ
  estimateHolds : growthEstimate bound 0

structure GrowthEstimatesAdmissibleClass where
  object : GrowthAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse