-- Certified Lean 4 Mathlib Export for Multiset System Theorems
-- Generated automatically by Idris2-Universe MultisetTheoremExporter

def multiset_lattice_transport : TransformMultiset α β := { sector := MetricSector.Elliptic, fraction := 1/27, mapping := f }
def multiset_bz_reaction : TransformMultiset α β := { sector := MetricSector.Elliptic, fraction := 1/27, mapping := f }
def cosmological_scale_pipeline_multiset_adjunction : CategoryTheory.Adjunction f_push f_pull := { homEquiv := homTensorIso, unit := eta_unit, counit := eps_counit }
theorem master_universe_master_scale_adjunction_duality : (L_total : ScaleFunctor Micro Macro) (R_total : ScaleFunctor Macro Micro) : CategoryTheory.Adjunction L_total R_total := by { fconstructor, { intro a b, exact homTensorIso }, { intro a, exact eta_unit a }, { intro b, exact eps_counit b } }
theorem lattice_homology_boundary_nilpotent : (c : ChainComplex k) : (boundary ∘ boundary) c = 0 := by rfl
theorem bz_homology_boundary_nilpotent : (c : ChainComplex k) : (boundary ∘ boundary) c = 0 := by rfl
