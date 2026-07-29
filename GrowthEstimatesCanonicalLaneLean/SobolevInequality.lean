import canonicalLaneMathlib.AdmissibleClass
import GrowthEstimatesCanonicalLaneLean.GrowthEstimatesDomain

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure SobolevData where
  domainDimension : ℕ
  exponent : ℝ
  sobolevConjugate : ℝ
  embeddingConstant : ℝ
  inequalities : Prop

structure SobolevInequality where
  data : SobolevData
  sobolevEmbedding : Prop
  morreyEstimate : Prop
  sobolevEmbeddingHolds : sobolevEmbedding
  morreyEstimateHolds : morreyEstimate

def SobolevClosed (S : SobolevInequality) : Prop :=
  S.sobolevEmbedding ∧ S.morreyEstimate

theorem sobolev_closed_from_evidence (S : SobolevInequality) : SobolevClosed S :=
  And.intro S.sobolevEmbeddingHolds S.morreyEstimateHolds

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse