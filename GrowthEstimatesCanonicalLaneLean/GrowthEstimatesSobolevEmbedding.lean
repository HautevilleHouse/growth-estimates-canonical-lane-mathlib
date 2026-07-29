import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesPointwiseEstimates

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesSobolevPackage {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    (Q : GrowthEstimatesPointwisePackage P) where
  sobolevInequality : Prop
  embeddingConstant : ℝ
  dimensionDependent : ℕ
  criticalExponent : ℝ

structure GrowthEstimatesSobolevEvidence {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P}
    (R : GrowthEstimatesSobolevPackage Q) where
  sobolevInequalityClosed : R.sobolevInequality
  embeddingConstantClosed : R.embeddingConstant = 1.0
  criticalExponentClosed : R.criticalExponent = 2.0

def GrowthEstimatesSobolevClosed {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P}
    (R : GrowthEstimatesSobolevPackage Q) : Prop :=
  R.sobolevInequality ∧ R.embeddingConstant = 1.0 ∧ R.criticalExponent = 2.0

theorem growth_estimates_sobolev_closed_from_evidence
    {A : GrowthEstimatesAdmissibleClass} {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P} (R : GrowthEstimatesSobolevPackage Q)
    (E : GrowthEstimatesSobolevEvidence R) : GrowthEstimatesSobolevClosed R := by
  exact And.intro E.sobolevInequalityClosed (And.intro E.embeddingConstantClosed E.criticalExponentClosed)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse