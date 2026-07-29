import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesAdmissibleObject where
  sourceKey : String
  growthType : String
  boundConstant : ℝ
  remainderBound : ℝ
  endpointCondition : Prop
  conclusion : endpointCondition

structure AdmissibleClass where
  object : GrowthEstimatesAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

theorem admitted_closure_from_evidence (A : AdmissibleClass) : admittedClosure A :=
  And.intro A.object.conclusion A.gateWitness

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse