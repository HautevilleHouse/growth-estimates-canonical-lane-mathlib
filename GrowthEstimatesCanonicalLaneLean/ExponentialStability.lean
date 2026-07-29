import GrowthEstimatesCanonicalLaneLean.MeanCurvatureFlow

/-!
# Exponential Stability Package
-/

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure ExponentialStabilityPackage {G : RiemannianCurvaturePackage}
  (F : MeanCurvatureFlowPackage G) where
  linearizedOperatorSpectralGap : Prop
  exponentialDecayRate : Prop
  asymptoticSelfSimilarity : Prop
  stabilityUnderPerturbation : Prop

structure ExponentialStabilityEvidence {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} (S : ExponentialStabilityPackage F) where
  linearizedOperatorSpectralGapClosed : S.linearizedOperatorSpectralGap
  exponentialDecayRateClosed : S.exponentialDecayRate
  asymptoticSelfSimilarityClosed : S.asymptoticSelfSimilarity
  stabilityUnderPerturbationClosed : S.stabilityUnderPerturbation

def ExponentialStabilityClosed {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} (S : ExponentialStabilityPackage F) : Prop :=
  S.linearizedOperatorSpectralGap ∧ S.exponentialDecayRate ∧
  S.asymptoticSelfSimilarity ∧ S.stabilityUnderPerturbation

theorem exponential_stability_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeanCurvatureFlowPackage G}
    (S : ExponentialStabilityPackage F) (E : ExponentialStabilityEvidence S) :
    ExponentialStabilityClosed S := by
  exact And.intro E.linearizedOperatorSpectralGapClosed
    (And.intro E.exponentialDecayRateClosed
      (And.intro E.asymptoticSelfSimilarityClosed E.stabilityUnderPerturbationClosed))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
