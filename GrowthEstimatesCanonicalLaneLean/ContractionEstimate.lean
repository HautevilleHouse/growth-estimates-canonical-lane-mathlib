import GrowthEstimatesCanonicalLaneLean.EigenvalueAsymptotics

/-!
# Contraction Estimate Package
-/

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure ContractionEstimatePackage {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F}
  {E : EigenvalueAsymptoticsPackage S} where
  volumeContractionRate : Prop
  areaRatioBound : Prop
  meanCurvatureIntegralDecay : Prop
  gaussianTailBound : Prop

structure ContractionEstimateEvidence {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F}
  {E : EigenvalueAsymptoticsPackage S} (C : ContractionEstimatePackage E) where
  volumeContractionRateClosed : C.volumeContractionRate
  areaRatioBoundClosed : C.areaRatioBound
  meanCurvatureIntegralDecayClosed : C.meanCurvatureIntegralDecay
  gaussianTailBoundClosed : C.gaussianTailBound

def ContractionEstimateClosed {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F}
  {E : EigenvalueAsymptoticsPackage S} (C : ContractionEstimatePackage E) : Prop :=
  C.volumeContractionRate ∧ C.areaRatioBound ∧
  C.meanCurvatureIntegralDecay ∧ C.gaussianTailBound

theorem contraction_estimate_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeanCurvatureFlowPackage G}
    {S : ExponentialStabilityPackage F} {E : EigenvalueAsymptoticsPackage S}
    (C : ContractionEstimatePackage E) (Ev : ContractionEstimateEvidence C) :
    ContractionEstimateClosed C := by
  exact And.intro Ev.volumeContractionRateClosed
    (And.intro Ev.areaRatioBoundClosed
      (And.intro Ev.meanCurvatureIntegralDecayClosed Ev.gaussianTailBoundClosed))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
