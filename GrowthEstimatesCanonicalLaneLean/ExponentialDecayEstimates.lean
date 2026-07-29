import canonicalLaneMathlib.AdmissibleClass
import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesDomain

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure ExponentialDecayData where
  decayRate : ℝ
  initialAmplitude : ℝ
  timeDomain : Type u
  decayLaw : Prop
  decayLawHolds : decayLaw

structure ExponentialDecayEstimates where
  data : ExponentialDecayData
  amplitudeBound : ℝ → ℝ
  exponentialEnvelope : ℝ → ℝ
  pointwiseInequality : Prop
  envelopeParameters : Prop
  pointwiseInequalityHolds : pointwiseInequality
  envelopeParametersHolds : envelopeParameters

def ExponentialDecayEstimatesClosed (E : ExponentialDecayEstimates) : Prop :=
  E.pointwiseInequality ∧ E.envelopeParameters

theorem exponential_decay_estimates_closed_from_evidence (E : ExponentialDecayEstimates) : ExponentialDecayEstimatesClosed E :=
  And.intro E.pointwiseInequalityHolds E.envelopeParametersHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse