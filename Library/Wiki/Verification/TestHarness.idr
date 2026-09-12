module Verification.TestHarness

import System

public export
record TestCase where
  constructor MkTestCase
  id     : Nat
  name   : String
  passed : Bool

export
runTestSuiteAcc : (Nat, Nat) -> List TestCase -> IO (Nat, Nat)
runTestSuiteAcc (p, f) [] = pure (p, f)
runTestSuiteAcc (p, f) (t :: ts) = do
  let status = if t.passed then "PASSED ✅" else "FAILED ❌"
  putStrLn $ "  [TEST " ++ show t.id ++ "] " ++ t.name ++ ": " ++ status
  if t.passed
     then runTestSuiteAcc (1 + p, f) ts
     else runTestSuiteAcc (p, 1 + f) ts

export
runTestSuite : String -> List TestCase -> IO (Nat, Nat)
runTestSuite suiteName tests = do
  putStrLn $ "--- " ++ suiteName ++ " ---"
  res <- runTestSuiteAcc (0, 0) tests
  putStrLn ""
  pure res
