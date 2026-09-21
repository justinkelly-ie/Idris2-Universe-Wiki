#!/usr/bin/env bash
set -e

echo "========================================================"
echo "   Building & Running FinSc-Universe-Wiki System Suite  "
echo "========================================================"
echo ""

pack build FinSc-Universe-Wiki.ipkg
./build/exec/universe-verify

echo ""
echo "========================================================"
echo "   All Invariants Executed Successfully!                "
echo "========================================================"

