import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesAdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesFunctionSpacePackage (A : GrowthEstimatesAdmissibleClass) where
  functionSpace : Type
  norm : functionSpace → ℝ
  growthCondition : (functionSpace → ℝ) → Prop
  linearStructure : Prop
  completeness : Prop

structure GrowthEstimatesFunctionSpaceEvidence {A : GrowthEstimatesAdmissibleClass} (P : GrowthEstimatesFunctionSpacePackage A) where
  growthConditionClosed : P.growthCondition (fun f => P.norm f)
  linearStructureClosed : P.linearStructure
  completenessClosed : P.completeness

def GrowthEstimatesFunctionSpaceClosed {A : GrowthEstimatesAdmissibleClass} (P : GrowthEstimatesFunctionSpacePackage A) : Prop :=
  P.growthCondition (fun f => P.norm f) ∧ P.linearStructure ∧ P.completeness

theorem growth_estimates_function_space_closed_from_evidence
    {A : GrowthEstimatesAdmissibleClass} (P : GrowthEstimatesFunctionSpacePackage A)
    (E : GrowthEstimatesFunctionSpaceEvidence P) : GrowthEstimatesFunctionSpaceClosed P := by
  exact And.intro E.growthConditionClosed (And.intro E.linearStructureClosed E.completenessClosed)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse