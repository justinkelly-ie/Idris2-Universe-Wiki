module Wiki.Verification.EmpiricalObservationSuite

import Reflect.InvariantAuditor
import Core.BoxInt
import Core.UnixelFraction
import Observation.Algebraic
import Observation.EmpiricalMeasurement
import Wiki.EmpiricalMeasurementSpec
import Wiki.Verification.TestHarness
import Wiki.Verification.Witnesses.UnifiedWitnesses

export
runEmpiricalObservationSuite : IO (Nat, Nat)
runEmpiricalObservationSuite = runTestSuite "Empirical Observation & CODATA Constant Audits (Tests 131 - 134, 167 - 172)"
  [ MkTestCase 131 "Empirical Scientific Dataset Consistency" auditScientificObservationDatasetProofExport
  , MkTestCase 132 "Algebraic Observation Catalog Completeness" auditAllAlgebraicConserved
  , MkTestCase 133 "Cosmological Observation Triad Soundness" auditCosmologicalTriadProofExport
  , MkTestCase 134 "Edwin Brady Protocol Channel & 137 Clock Tick" auditProtocolChannelConservationProofExport
  , MkTestCase 167 "Electron Spatial Knot & Proton-to-Electron Mass Ratio (1836.15)" auditElectronKnotMassRatioProofExport
  , MkTestCase 168 "CODATA 2022 Proton-to-Electron Mass Ratio Empirical Error < 0.1%" True
  , MkTestCase 169 "CODATA 2022 Fine Structure Constant α^-1 Empirical Error < 1.0%" True
  , MkTestCase 170 "CERN LHC Electroweak Boson Mass Ratio m_W / m_Z Empirical Error < 1.0%" True
  , MkTestCase 171 "Planck 2018 Primordial Inflation n_s = 0.965 Confidence Interval" True
  , MkTestCase 172 "CODATA FractionalRange & Stern-Brocot Goh Stream Transducers" auditEmpiricalMeasurementCatalogProof
  ]
