import GrowthEstimatesCanonicalLaneLean.RiemannianCurvature

/-!
# Mean Curvature Flow Package
-/

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure MeanCurvatureFlowPackage (G : RiemannianCurvaturePackage) where
  timeParameter : Type u
  evolvingHypersurface : timeParameter → Type v
  initialSurfaceEmbedded : Prop
  meanCurvatureEvolution : Prop
  shortTimeExistence : Prop

structure MeanCurvatureFlowEvidence {G : RiemannianCurvaturePackage} (F : MeanCurvatureFlowPackage G) where
  initialSurfaceEmbeddedClosed : F.initialSurfaceEmbedded
  meanCurvatureEvolutionClosed : F.meanCurvatureEvolution
  shortTimeExistenceClosed : F.shortTimeExistence

def MeanCurvatureFlowClosed {G : RiemannianCurvaturePackage} (F : MeanCurvatureFlowPackage G) : Prop :=
  F.initialSurfaceEmbedded ∧ F.meanCurvatureEvolution ∧ F.shortTimeExistence

theorem mean_curvature_flow_closed_from_evidence
    {G : RiemannianCurvaturePackage} (F : MeanCurvatureFlowPackage G)
    (E : MeanCurvatureFlowEvidence F) : MeanCurvatureFlowClosed F := by
  exact And.intro E.initialSurfaceEmbeddedClosed
    (And.intro E.meanCurvatureEvolutionClosed E.shortTimeExistenceClosed)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
