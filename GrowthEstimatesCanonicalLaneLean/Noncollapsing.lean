import GrowthEstimatesCanonicalLaneLean.CompactnessInequality

namespace HautevilleHouse
namespace GrowthEstimatesCanonicalLaneLean

structure NoncollapsingPackage {G : NormedGrowthPackage} {F : FunctionGrowthPackage G} (C : CompactnessInequalityPackage F) where
  volumeLowerBoundUniform : Prop
  curvatureScaleControl : Prop
  extremalSubsequenceNoncollapsed : Prop

structure NoncollapsingEvidence {G : NormedGrowthPackage} {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F} (N : NoncollapsingPackage C) where
  volumeLowerBoundUniformClosed : N.volumeLowerBoundUniform
  curvatureScaleControlClosed : N.curvatureScaleControl
  extremalSubsequenceNoncollapsedClosed : N.extremalSubsequenceNoncollapsed

def NoncollapsingClosed {G : NormedGrowthPackage} {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F} (N : NoncollapsingPackage C) : Prop :=
  N.volumeLowerBoundUniform ∧ N.curvatureScaleControl ∧ N.extremalSubsequenceNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : NormedGrowthPackage} {F : FunctionGrowthPackage G} {C : CompactnessInequalityPackage F}
    (N : NoncollapsingPackage C) (E : NoncollapsingEvidence N) : NoncollapsingClosed N := by
  exact And.intro E.volumeLowerBoundUniformClosed
    (And.intro E.curvatureScaleControlClosed E.extremalSubsequenceNoncollapsedClosed)

end GrowthEstimatesCanonicalLaneLean
end HautevilleHouse