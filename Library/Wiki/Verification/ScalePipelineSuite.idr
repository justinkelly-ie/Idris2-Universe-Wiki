module Verification.ScalePipelineSuite

import InvertedOpenScaleTransformSpec
import Reflect.InvariantAuditor
import Verification.TestHarness
import Verification.Witnesses.UnifiedWitnesses

export
runScalePipelineSuite : IO (Nat, Nat)
runScalePipelineSuite = runTestSuite "Functorial Scale Pipeline & Galois Adjunctions (Tests 135 - 166, 172)"
  [ MkTestCase 135 "Pure Algebraic Galois Connection (f_* ⊣ f^*)" auditGaloisConnectionProofExport
  , MkTestCase 136 "Idris 2 Control.App Linear Resource Architecture" auditUniverseAppProofExport
  , MkTestCase 137 "Multi-System Control.App Interaction Architecture" auditMultiSystemInteractionProofExport
  , MkTestCase 138 "Automated Galois Scale-Jump Architecture (f_* ⊣ f^*)" auditGaloisScaleJumpProofExport
  , MkTestCase 139 "Constructive Quantum Density Matrices & Born Rule" auditDensityMatrixBornRuleProofExport
  , MkTestCase 140 "Thermodynamic Causal Arrow & Jarzynski Equality" auditJarzynskiThermalProofExport
  , MkTestCase 141 "Discrete Galois Einstein Curvature Tensor" auditGaloisEinsteinCurvatureProofExport
  , MkTestCase 142 "Fault-Tolerant Kitaev Toric Code Recovery (Law 36)" auditToricSyndromeProofExport
  , MkTestCase 143 "Dyck-Huffman Horizon Evaporation Stream (Law 21)" auditHolographicStreamProofExport
  , MkTestCase 144 "Biological Ribosomal Translation & Biomolecules" auditBiomolecularPipelineProofExport
  , MkTestCase 145 "Interactive FiniteScienceREPL Engine Architecture" auditReplEngineProofExport
  , MkTestCase 146 "Emergent Galactic Rotation Curve & Dark Matter Simulation" auditGalacticRotationTimeSeriesProofExport
  , MkTestCase 147 "Anti-Matter Multiset Annihilation & CKM/PMNS CP-Violation" auditAntiMatterAnnihilationProofExport
  , MkTestCase 148 "Full Standard Model Particle Catalog & Multiset Vertices" auditFullStandardModelCatalogProofExport
  , MkTestCase 149 "High-Energy 2-to-2 Particle Scattering Kinematics" auditParticleScatteringProofExport
  , MkTestCase 150 "Hadronization & QGP Jet Fragmentation Automaton" auditHadronizationEngineProofExport
  , MkTestCase 151 "3-Flavor Neutrino Oscillation Time-Series & PMNS" auditNeutrinoOscillationProofExport
  , MkTestCase 152 "Universal Transform Multiset Factorization (G ⊗ Z ⊗ J)" (auditQuarkToBaryonTransformProofExport && auditBasePairingTransformProofExport)
  , MkTestCase 153 "End-to-End Functorial Scale Pipeline (T_total = T4 ∘ T3 ∘ T2 ∘ T1)" auditFunctorialPipelineProofExport
  , MkTestCase 154 "Automatic Reverse-Causal Reconstruction & Galois Adjunction Duality (f_* ⊣ f^*)" auditReverseCausalReconstructionProofExport
  , MkTestCase 155 "O(log N) Parallelized MultisetTree Transform Application" auditTreeTransformEngineProofExport
  , MkTestCase 156 "Interactive REPL Dynamic Transform Synthesis" auditReplTransformEngineProofExport
  , MkTestCase 157 "Multiset Formal Theorem Exporter (Lean 4, Coq, LaTeX)" auditMultisetTheoremExporterProofExport
  , MkTestCase 158 "Helmholtz Free Energy Minimization under Transforms (F = U - TS)" auditFreeEnergyMinimizerProofExport
  , MkTestCase 159 "Multiset 2-Category Tensor Engine & Spectral Solver" auditMultisetTensorEngineProofExport
  , MkTestCase 160 "Multiset Quantum Density Matrices, Lie Algebra, Unitary Classifiers & Tensor Networks" auditMultisetAdvancedTensorEngineProofExport
  , MkTestCase 161 "Discrete Higgs Mechanism Potential & Symmetry Breaking (V(φ), m_W, m_H)" auditHiggsVacuumStabilityProofExport
  , MkTestCase 162 "1-Loop Discrete Vacuum Polarization & Running Fine Structure Coupling α(q^2)" auditVacuumPolarizationProofExport
  , MkTestCase 163 "Dynamic Spacetime Spin Networks & Geometric Rewiring" auditSpinNetworkVolumeProofExport
  , MkTestCase 164 "Cosmic Inflation & Primordial Perturbation Power Spectrum (n_s)" auditCosmicInflationProofExport
  , MkTestCase 165 "Quantum Stress-Energy Tensor in Curved Spacetime <T_μν>" auditQuantumStressTensorProofExport
  , MkTestCase 166 "Active Inference Neural Networks & Free Energy Minimization" auditActiveInferenceNeuralNetworkProofExport
  , MkTestCase 172 "Inverted Open Universe Scale Transform Architecture" auditInvertedOpenScaleTransformProof
  ]
