#!/usr/bin/env bash
set -e

echo "========================================================"
echo "   Building & Running Idris2-Universe-Wiki System Suite  "
echo "========================================================"
echo ""

pack build Idris2-Universe-Wiki.ipkg
./build/exec/universe-verify

echo ""
echo "========================================================"
echo "   All Invariants Executed Successfully!                "
echo "========================================================"

