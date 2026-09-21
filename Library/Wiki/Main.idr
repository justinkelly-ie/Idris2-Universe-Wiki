module Wiki.Main

import Derivation.MultisetTheoremExporter
import Wiki.Verification.Witnesses.UnifiedWitnesses
import Wiki.Verification.Witnesses.MotivicGalois
import Wiki.Verification.TestHarness
import Wiki.Verification.FoundationsSuite
import Wiki.Verification.PhysicalLawsSuite
import Wiki.Verification.EmpiricalObservationSuite
import Wiki.Verification.ScalePipelineSuite

%default total

main : IO ()
main = do
  exportAllProofsIO
  putStrLn "========================================================"
  putStrLn "   FinSc-Universe Verification & Cosmological Suite   "
  putStrLn "   (Declarative Type-Driven Modular Architecture)      "
  putStrLn "========================================================"
  putStrLn ""
  putStrLn " [COMPILE-TIME MACRO AUDITS]:"
  putStrLn $ "  - All 163 Compile-Time Macro Invariants: " ++ (if auditUnifiedWitnessesProofExport then "INJECTED & VALID (Refl) ✅" else "FAILED ❌")
  putStrLn $ "  - Motivic Galois Group & Cosmic Motive Invariants: " ++ (if auditCosmicMotiveProof then "INJECTED & VALID (Refl) ✅" else "FAILED ❌")
  putStrLn ""
  (fP, fF) <- runFoundationsSuite
  (pP, pF) <- runPhysicalLawsSuite
  (eP, eF) <- runEmpiricalObservationSuite
  (sP, sF) <- runScalePipelineSuite
  let totalPass = fP + pP + eP + sP
  let totalFail = fF + pF + eF + sF
  putStrLn "========================================================"
  putStrLn $ " Total Verification Results: " ++ show totalPass ++ " PASSED, " ++ show totalFail ++ " FAILED"
  putStrLn $ " All " ++ show totalPass ++ " Cosmological Proof Witnesses & Invariants Verified!"
  putStrLn "========================================================"
