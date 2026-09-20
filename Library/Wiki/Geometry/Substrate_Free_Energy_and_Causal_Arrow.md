# 🌌 Substrate Metric Domain: Free Energy & Causal Arrow ($210$ Master Budget)

The **Substrate Metric Sector** is the underlying master space ($g_{22} = 0, g_{12} = 1$) that unifies the three physical metric sectors into the **Primorial $210$ Budget** ($210 = 27 + 128 + 55$). It establishes the thermodynamic causal arrow of time ($\Delta S \neq 0$) and discrete Helmholtz Free Energy minimization.

---

## 1. Physical Law & Primorial Allocation

The Substrate Sector governs the complete partition function of the discrete universe:

\[
Z_{\text{Cosmic}}(q) = Z_{\text{Ell}}^{27}(q) \times Z_{\text{Hyp}}^{128}(q) \times Z_{\text{Par}}^{55}(q)
\]

- **Metric Components**: $g_{22} = 0, g_{12} = 1$ (Asymmetric lightcone metric enforcing monotonic time evolution).
- **Master Budget**: Primorial $210 = 2 \times 3 \times 5 \times 7 = 27 + 128 + 55$.
- **Ground State Minimum**: Unique discrete Helmholtz Free Energy minimum $F_{\text{ground}} = -1320$.

Because $g_{12} = 1$ while $g_{22} = 0$, state evolution is strictly asymmetric, preventing time-reversal paradoxes and establishing the thermodynamic Arrow of Time at fundamental scale.

---

## 2. Executable Literate Verification

The following literate Idris 2 module verifies the Substrate ground state free energy minimization:

```idris
module Wiki.Geometry.Substrate_Free_Energy_and_Causal_Arrow

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset
import Derivation.FreeEnergyMinimizer

%default total

||| Verifies that the Substrate master budget (210) achieves the exact discrete
||| Helmholtz Free Energy ground state minimum F = -1320.
public export
evidence_substrate_free_energy : Bool
evidence_substrate_free_energy =
  Derivation.FreeEnergyMinimizer.auditFreeEnergyMinimizerProof
```

### Contextual Explanation of Code Assertions:
1. `evidence_substrate_free_energy`: Calls `auditFreeEnergyMinimizerProof`, which computes the exact free energy $F = U - TS$ across the partitioned 210 capacity budget.
2. The function evaluates whether the energy calculation reduces exactly to the ground state energy $F = -1320$, returning `True` at compile time.
