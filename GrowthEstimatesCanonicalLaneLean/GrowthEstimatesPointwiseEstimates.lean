import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesFunctionSpace

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesPointwisePackage {A : GrowthEstimatesAdmissibleClass}
    (P : GrowthEstimatesFunctionSpacePackage A) where
  pointwiseBound : A.object.functionSpace → ℝ → Prop
  decayCondition : ℝ → Prop
  uniformConstant : ℝ
  estimateAtInfinity : Prop

structure GrowthEstimatesPointwiseEvidence {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A} (Q : GrowthEstimatesPointwisePackage P) where
  pointwiseBoundClosed : ∀ (f : A.object.functionSpace) (x : ℝ), Q.pointwiseBound f x → |A.object.norm f| ≤ Q.uniformConstant
  decayConditionClosed : Q.decayCondition 0
  estimateAtInfinityClosed : Q.estimateAtInfinity

def GrowthEstimatesPointwiseClosed {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A} (Q : GrowthEstimatesPointwisePackage P) : Prop :=
  (∀ (f : A.object.functionSpace) (x : ℝ), Q.pointwiseBound f x → |A.object.norm f| ≤ Q.uniformConstant) ∧
  Q.decayCondition 0 ∧ Q.estimateAtInfinity

theorem growth_estimates_pointwise_closed_from_evidence
    {A : GrowthEstimatesAdmissibleClass} {P : GrowthEstimatesFunctionSpacePackage A}
    (Q : GrowthEstimatesPointwisePackage P) (E : GrowthEstimatesPointwiseEvidence Q) :
    GrowthEstimatesPointwiseClosed Q := by
  exact And.intro E.pointwiseBoundClosed (And.intro E.decayConditionClosed E.estimateAtInfinityClosed)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse