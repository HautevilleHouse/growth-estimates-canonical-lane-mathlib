import GrowthEstimatesCanonicalLaneLean.ExponentialStability

/-!
# Eigenvalue Asymptotics Package
-/

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure EigenvalueAsymptoticsPackage {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F} where
  leadingOrderEigenvalue : Prop
  spectralGapPositivity : Prop
  asymptoticExpansion : Prop
  errorTermControl : Prop

structure EigenvalueAsymptoticsEvidence {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F}
  (E : EigenvalueAsymptoticsPackage S) where
  leadingOrderEigenvalueClosed : E.leadingOrderEigenvalue
  spectralGapPositivityClosed : E.spectralGapPositivity
  asymptoticExpansionClosed : E.asymptoticExpansion
  errorTermControlClosed : E.errorTermControl

def EigenvalueAsymptoticsClosed {G : RiemannianCurvaturePackage}
  {F : MeanCurvatureFlowPackage G} {S : ExponentialStabilityPackage F}
  (E : EigenvalueAsymptoticsPackage S) : Prop :=
  E.leadingOrderEigenvalue ∧ E.spectralGapPositivity ∧
  E.asymptoticExpansion ∧ E.errorTermControl

theorem eigenvalue_asymptotics_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : MeanCurvatureFlowPackage G}
    {S : ExponentialStabilityPackage F} (E : EigenvalueAsymptoticsPackage S)
    (Ev : EigenvalueAsymptoticsEvidence E) : EigenvalueAsymptoticsClosed E := by
  exact And.intro Ev.leadingOrderEigenvalueClosed
    (And.intro Ev.spectralGapPositivityClosed
      (And.intro Ev.asymptoticExpansionClosed Ev.errorTermControlClosed))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse
