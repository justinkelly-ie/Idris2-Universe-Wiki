module Verification.FoundationsSuite

import Reflect.InvariantAuditor
import Verification.Witnesses.UnifiedWitnesses
import Verification.TestHarness

export
runFoundationsSuite : IO (Nat, Nat)
runFoundationsSuite = runTestSuite "Foundations & Geometric Invariants (Tests 1 - 43)"
  [ MkTestCase 1  "27-State Ternary Spacetime Closure" auditTernaryClosureProofExport
  , MkTestCase 2  "Nilpotent Matrix Unit (ε² = 0)" auditTernaryClosureProofExport
  , MkTestCase 3  "Genesis Vacuum Baseline (Epoch 1)" auditTernaryClosureProofExport
  , MkTestCase 4  "Epoch 37 Ground State (Budget=210)" auditChromogeometricBudgetProofExport
  , MkTestCase 5  "Epoch 38 Step-Up (55 -> 56 DM)" auditEpoch38CollapseProofExport
  , MkTestCase 6  "Asymmetric Causal Arrow (g22 = 0)" auditSubstrateActionAsymmetryProofExport
  , MkTestCase 7  "Dual Number Discrete Calculus" auditDualComplexMultiplicationProofExport
  , MkTestCase 8  "Nat Derived from Empty Boxes (0..37)" auditChromogeometricBudgetProofExport
  , MkTestCase 9  "Archimedes' Function & Quadrea (DEC)" auditOnSeqClipExtractionProofExport
  , MkTestCase 10 "Nested Polynomial Multiset Division" auditUnixelFractionPositivityProofExport
  , MkTestCase 11 "3D Lattice Topology & Flux Conserved" auditDiscreteNoetherConservationProofExport
  , MkTestCase 12 "Option A (Epoch 3 Hadronic Singlet)" auditTernaryClosureProofExport
  , MkTestCase 13 "Option B (Epoch 4 Alpha Cluster 108)" auditChromogeometricBudgetProofExport
  , MkTestCase 14 "Cyclotomic Encoding & Drag Decoding" auditRelativisticVelocityLensingProofExport
  , MkTestCase 15 "Emergent Toroidal Topology (T³)" auditToroidalPeriodicityProofExport
  , MkTestCase 16 "The 12 Emergent Laws of Physics" auditDiscreteNoetherConservationProofExport
  , MkTestCase 17 "Wildberger's Finitist Quantum Mechanics" auditTernaryClosureProofExport
  , MkTestCase 18 "Quantum Measurement & Superposition" auditMultisetCrossEntropyProofExport
  , MkTestCase 19 "Structural Accounting Invariants" auditRowExtractionProofExport
  , MkTestCase 20 "Structural Associativity Across Scales" auditMultisetTreeTokenSumProofExport
  , MkTestCase 21 "2D Maxwell Equations (DEC)" auditDiscreteNoetherConservationProofExport
  , MkTestCase 22 "Dynamic 4x4 Grid Expansion" auditChromogeometricBudgetProofExport
  , MkTestCase 23 "Vexels, Maxels & Reflected Algebra" auditRowExtractionProofExport
  , MkTestCase 24 "3D DEC & Yang-Mills Gauge Theory" auditYangMillsPlaquetteCrossEntropyProofExport
  , MkTestCase 25 "Tier 5 Molecular Bonding (Chemistry)" auditTier5MolecularBondingProofExport
  , MkTestCase 26 "Matter Numerator / Law Denominator" auditRelativisticVelocityLensingProofExport
  , MkTestCase 27 "Unixel Fractions & OnSeq Algebra" (auditUnixelFractionPositivityProofExport && auditRationalEquivalenceProofExport)
  , MkTestCase 28 "Reflected Fractions & QTT Sequences" (auditHehnerScaleConversionProofExport && auditMultisetCompactnessProofExport)
  , MkTestCase 29 "Multiset Clifford Geometric Algebra" auditCliffordGeometricProductProofExport
  , MkTestCase 30 "Symplectic Leapfrog Invariants" auditSymplecticPhaseInvarianceProofExport
  , MkTestCase 31 "Hehner Scale Conversion & Norm" auditHehnerScaleConversionProofExport
  , MkTestCase 32 "Multiset Information Distance Metric" auditMultisetInformationDistanceProofExport
  , MkTestCase 33 "Multiset Born Rule & Hehner Triad" auditMultisetHehnerTriadProofExport
  , MkTestCase 34 "Multiset Cross-Entropy Properties" auditMultisetCrossEntropyProofExport
  , MkTestCase 35 "Multiset Compactness / Intelligence" auditMultisetCompactnessProofExport
  , MkTestCase 36 "Hyperbolic Geodesic Bit Duality" auditHyperbolicBitDualityProofExport
  , MkTestCase 37 "Clifford Compactness Duality" auditCliffordCompactnessDualityProofExport
  , MkTestCase 38 "Chromogeometric Cosmic Budget 210" auditChromogeometricBudgetProofExport
  , MkTestCase 39 "Holographic Boundary Duality (54 M)" auditHolographicBoundaryDualityProofExport
  , MkTestCase 40 "Yang-Mills Plaquette Cross-Entropy" auditYangMillsPlaquetteCrossEntropyProofExport
  , MkTestCase 41 "Constructivist Landauer Relocation" auditLandauerTokenConservationProofExport
  , MkTestCase 42 "Multi-Scale RG Invariance (100%)" auditRenormalizationInvarianceProofExport
  , MkTestCase 43 "Master Cosmological Inferences" auditCosmologicalInferencesProofExport
  ]
