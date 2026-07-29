import GrowthEstimatesCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure NormedGrowthEvidenceTerms {G : NormedGrowthPackage}
    (C : NormedGrowthAnalyticCertificate G) where
  normedAdmissible : C.normedAdmissible
  derivativeEstimate : C.derivativeEstimate
  growthEstimate : C.growthEstimate
  normedGrowthClosed : NormedGrowthClosed G

def NormedGrowthAnalyticCertificate.evidenceTerms {G : NormedGrowthPackage}
    (C : NormedGrowthAnalyticCertificate G) : NormedGrowthEvidenceTerms C :=
  {
    normedAdmissible := C.normedAdmissibleClosed
    derivativeEstimate := C.derivativeEstimateClosed
    growthEstimate := C.growthEstimateClosed
    normedGrowthClosed := normed_growth_closed_from_evidence G C.normedGrowthEvidence
  }

structure FunctionGrowthEvidenceTerms {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} (C : FunctionGrowthAnalyticCertificate F) where
  regularity : C.regularity
  growthRate : C.growthRate
  decayEstimate : C.decayEstimate
  functionGrowthClosed : FunctionGrowthClosed F

def FunctionGrowthAnalyticCertificate.evidenceTerms {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} (C : FunctionGrowthAnalyticCertificate F) : FunctionGrowthEvidenceTerms C :=
  {
    regularity := C.regularityClosed
    growthRate := C.growthRateClosed
    decayEstimate := C.decayEstimateClosed
    functionGrowthClosed := function_growth_closed_from_evidence F C.functionGrowthEvidence
  }

structure CompactnessInequalityEvidenceTerms {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F}
    (P : CompactnessInequalityAnalyticCertificate C) where
  extremalSequence : P.extremalSequence
  compactEmbedding : P.compactEmbedding
  inequalityConstant : P.inequalityConstant
  compactnessInequalityClosed : CompactnessInequalityClosed C

def CompactnessInequalityAnalyticCertificate.evidenceTerms {G : NormedGrowthPackage}
    {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F}
    (P : CompactnessInequalityAnalyticCertificate C) : CompactnessInequalityEvidenceTerms P :=
  {
    extremalSequence := P.extremalSequenceClosed
    compactEmbedding := P.compactEmbeddingClosed
    inequalityConstant := P.inequalityConstantClosed
    compactnessInequalityClosed := compactness_inequality_closed_from_evidence C P.compactnessInequalityEvidence
  }

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse