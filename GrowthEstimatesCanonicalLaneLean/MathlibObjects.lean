import GrowthEstimatesCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.NormedSpace.Basic

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthSpace where
  carrier : Type
  norm : carrier → ℝ
  norm_nonneg : ∀ x : carrier, 0 ≤ norm x
  norm_zero_iff : ∀ x : carrier, norm x = 0 ↔ x = (0 : carrier)
  triangle_inequality : ∀ x y : carrier, norm (x + y) ≤ norm x + norm y
  linear_combination : ∀ a : ℝ, ∀ x : carrier, norm (a • x) = |a| * norm x

structure GrowthAdmittedObject where
  space : GrowthSpace
  boundedSubsets : Prop
  growthEstimates : Prop
  conclusion : growthEstimates

structure GrowthEndgameState where
  object : GrowthAdmittedObject

def GrowthWitnessClosed (O : GrowthAdmittedObject) : Prop :=
  O.growthEstimates

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse