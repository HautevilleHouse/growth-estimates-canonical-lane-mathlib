import canonicalLaneMathlib.AdmissibleClass
import GrowthEstimatesCanonicalLaneLean.ExponentialDecayEstimates

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure HarnackData where
  baseEstimate : ExponentialDecayEstimatesClosed
  temperatureParameter : ℝ
  dimension : ℕ
  harnackConstant : ℝ
  monotonicity : Prop

structure HarnackInequality where
  data : HarnackData
  differentialHarnack : Prop
  ellipticHarnack : Prop
  differentialHarnackHolds : differentialHarnack
  ellipticHarnackHolds : ellipticHarnack

def HarnackClosed (H : HarnackInequality) : Prop :=
  H.differentialHarnack ∧ H.ellipticHarnack

theorem harnack_closed_from_evidence (H : HarnackInequality) : HarnackClosed H :=
  And.intro H.differentialHarnackHolds H.ellipticHarnackHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse