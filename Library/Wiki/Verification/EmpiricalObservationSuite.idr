module Verification.EmpiricalObservationSuite

import Core.BoxInt
import Empirical.Comparison
import Empirical.Measurements
import Empirical.Ratio
import Observation.Algebraic
import Reflect.InvariantAuditor
import Verification.TestHarness
import Verification.Witnesses.UnifiedWitnesses

export
runEmpiricalObservationSuite : IO (Nat, Nat)
runEmpiricalObservationSuite = runTestSuite "Empirical Observation & CODATA Constant Audits (Tests 131 - 134, 167 - 171)"
  [ MkTestCase 131 "Empirical Scientific Dataset Consistency" auditScientificObservationDatasetProofExport
  , MkTestCase 132 "Algebraic Observation Catalog Completeness" auditAllAlgebraicConserved
  , MkTestCase 133 "Cosmological Observation Triad Soundness" auditCosmologicalTriadProofExport
  , MkTestCase 134 "Edwin Brady Protocol Channel & 137 Clock Tick" auditProtocolChannelConservationProofExport
  , MkTestCase 167 "Electron Spatial Knot & Proton-to-Electron Mass Ratio (1836.15)" auditElectronKnotMassRatioProofExport
  , MkTestCase 168 "CODATA 2022 Proton-to-Electron Mass Ratio Empirical Error < 0.1%" test168
  , MkTestCase 169 "CODATA 2022 Fine Structure Constant α^-1 Empirical Error < 1.0%" test169
  , MkTestCase 170 "CERN LHC Electroweak Boson Mass Ratio m_W / m_Z Empirical Error < 1.0%" test170
  , MkTestCase 171 "Planck 2018 Primordial Inflation n_s = 0.965 Confidence Interval" test171
  ]
  where
    test168 : Bool
    test168 = auditRatioMatchesWithinPercentError (mkUnixelFraction (intToBoxInt 183615) 100) protonElectronMassRatio (mkUnixelFraction 1 1000)

    test169 : Bool
    test169 = auditRatioMatchesWithinPercentError (mkUnixelFraction (intToBoxInt 137) 1) inverseFineStructureConstant (mkUnixelFraction 1 100)

    test170 : Bool
    test170 = auditRatioMatchesWithinPercentError (mkUnixelFraction (intToBoxInt 881) 1000) electroweakBosonMassRatio (mkUnixelFraction 1 100)

    test171 : Bool
    test171 = auditRatioWithinConfidenceInterval (mkUnixelFraction (intToBoxInt 965) 1000) cosmicInflationSpectralIndex
