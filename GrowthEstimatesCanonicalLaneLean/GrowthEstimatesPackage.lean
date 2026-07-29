import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure GrowthEstimatesPackage where
  constant : Type u
  monotonicity : Prop
  comparability : Prop
  asymptoticBound : Prop
  sharpConstant : Prop

structure GrowthEstimatesEvidence (G : GrowthEstimatesPackage) where
  monotonicityClosed : G.monotonicity
  comparabilityClosed : G.comparability
  asymptoticBoundClosed : G.asymptoticBound
  sharpConstantClosed : G.sharpConstant

def GrowthEstimatesClosed (G : GrowthEstimatesPackage) : Prop :=
  G.monotonicity ∧ G.comparability ∧ G.asymptoticBound ∧ G.sharpConstant

theorem growth_estimates_closed_from_evidence (G : GrowthEstimatesPackage)
    (E : GrowthEstimatesEvidence G) : GrowthEstimatesClosed G := by
  exact And.intro E.monotonicityClosed
    (And.intro E.comparabilityClosed
      (And.intro E.asymptoticBoundClosed E.sharpConstantClosed))

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse