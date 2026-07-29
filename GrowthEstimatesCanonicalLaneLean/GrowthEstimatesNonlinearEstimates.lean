import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesSobolevEmbedding

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesNonlinearPackage {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P}
    (R : GrowthEstimatesSobolevPackage Q) where
  nonlinearGrowthBound : Prop
  iterationBound : ℕ → ℝ
  contractionFactor : ℝ
  fixedPointEstimate : A.object.functionSpace → Prop

structure GrowthEstimatesNonlinearEvidence {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P}
    {R : GrowthEstimatesSobolevPackage Q}
    (S : GrowthEstimatesNonlinearPackage R) where
  nonlinearGrowthBoundClosed : S.nonlinearGrowthBound
  iterationBoundClosed : ∀ n : ℕ, S.iterationBound n ≤ A.object.bound
  contractionFactorClosed : S.contractionFactor < 1
  fixedPointEstimateClosed : S.fixedPointEstimate (λ x => 0)

def GrowthEstimatesNonlinearClosed {A : GrowthEstimatesAdmissibleClass}
    {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P}
    {R : GrowthEstimatesSobolevPackage Q}
    (S : GrowthEstimatesNonlinearPackage R) : Prop :=
  S.nonlinearGrowthBound ∧ (∀ n : ℕ, S.iterationBound n ≤ A.object.bound) ∧
  S.contractionFactor < 1 ∧ S.fixedPointEstimate (λ x => 0)

theorem growth_estimates_nonlinear_closed_from_evidence
    {A : GrowthEstimatesAdmissibleClass} {P : GrowthEstimatesFunctionSpacePackage A}
    {Q : GrowthEstimatesPointwisePackage P} {R : GrowthEstimatesSobolevPackage Q}
    (S : GrowthEstimatesNonlinearPackage R) (E : GrowthEstimatesNonlinearEvidence S) :
    GrowthEstimatesNonlinearClosed S := by
  exact And.intro E.nonlinearGrowthBoundClosed
    (And.intro E.iterationBoundClosed
      (And.intro E.contractionFactorClosed E.fixedPointEstimateClosed))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse