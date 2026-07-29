import GrowthEstimatesCanonicalLaneLean.Noncollapsing

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure NormedGrowthAnalyticCertificate (G : NormedGrowthPackage) where
  normedAdmissible : Prop
  derivativeEstimate : Prop
  growthEstimate : Prop
  normedAdmissibleClosed : normedAdmissible
  derivativeEstimateClosed : derivativeEstimate
  growthEstimateClosed : growthEstimate
  normedGrowthEvidence : NormedGrowthEvidence G

def NormedGrowthAnalyticCertificateClosed {G : NormedGrowthPackage}
    (C : NormedGrowthAnalyticCertificate G) : Prop :=
  C.normedAdmissible ∧ C.derivativeEstimate ∧ C.growthEstimate ∧ NormedGrowthClosed G

theorem normed_growth_analytic_certificate_closed
    {G : NormedGrowthPackage} (C : NormedGrowthAnalyticCertificate G) :
    NormedGrowthAnalyticCertificateClosed C := by
  exact And.intro C.normedAdmissibleClosed
    (And.intro C.derivativeEstimateClosed
      (And.intro C.growthEstimateClosed
        (normed_growth_closed_from_evidence G C.normedGrowthEvidence)))

structure FunctionGrowthAnalyticCertificate {G : NormedGrowthPackage}
    (F : FunctionGrowthPackage G) where
  regularity : Prop
  growthRate : Prop
  decayEstimate : Prop
  regularityClosed : regularity
  growthRateClosed : growthRate
  decayEstimateClosed : decayEstimate
  functionGrowthEvidence : FunctionGrowthEvidence F

def FunctionGrowthAnalyticCertificateClosed {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} (C : FunctionGrowthAnalyticCertificate F) : Prop :=
  C.regularity ∧ C.growthRate ∧ C.decayEstimate ∧ FunctionGrowthClosed F

theorem function_growth_analytic_certificate_closed
    {G : NormedGrowthPackage} {F : FunctionGrowthPackage G}
    (C : FunctionGrowthAnalyticCertificate F) :
    FunctionGrowthAnalyticCertificateClosed C := by
  exact And.intro C.regularityClosed
    (And.intro C.growthRateClosed
      (And.intro C.decayEstimateClosed
        (function_growth_closed_from_evidence F C.functionGrowthEvidence)))

structure CompactnessInequalityAnalyticCertificate {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} (C : CompactnessInequalityPackage F) where
  extremalSequence : Prop
  compactEmbedding : Prop
  inequalityConstant : Prop
  extremalSequenceClosed : extremalSequence
  compactEmbeddingClosed : compactEmbedding
  inequalityConstantClosed : inequalityConstant
  compactnessInequalityEvidence : CompactnessInequalityEvidence C

def CompactnessInequalityAnalyticCertificateClosed {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F}
    (P : CompactnessInequalityAnalyticCertificate C) : Prop :=
  P.extremalSequence ∧ P.compactEmbedding ∧ P.inequalityConstant ∧ CompactnessInequalityClosed C

theorem compactness_inequality_analytic_certificate_closed
    {G : NormedGrowthPackage} {F : FunctionGrowthPackage G}
    {C : CompactnessInequalityPackage F} (P : CompactnessInequalityAnalyticCertificate C) :
    CompactnessInequalityAnalyticCertificateClosed P := by
  exact And.intro P.extremalSequenceClosed
    (And.intro P.compactEmbeddingClosed
      (And.intro P.inequalityConstantClosed
        (compactness_inequality_closed_from_evidence C P.compactnessInequalityEvidence)))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse