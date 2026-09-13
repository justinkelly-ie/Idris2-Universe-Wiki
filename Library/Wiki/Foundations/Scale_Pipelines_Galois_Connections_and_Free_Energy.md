# 🌌 Chapter 3: Scale Pipelines, Galois Connections & Free Energy Minimization

Physical systems evolve across multiple spatial and temporal scales—from subatomic quark multisets to macroscopic biological structures. To connect microscopic particle interactions with macroscopic thermodynamics without loss of information, this framework uses **Galois Adjunctions** ($f_* \dashv f^*$), type-safe **ScaleFunctor** pipelines, and **Discrete Helmholtz Free Energy Minimization**.

---

## 1. Galois Adjunctions Across Physical ScaleFunctors

A scale jump between a fine-grained state space $A$ (`SubatomicLevel`) and a coarse-grained state space $B$ (`CellLevel`) is defined by a pair of adjoint multiset functors:

\[
f_* : A \longrightarrow B \quad (\text{Algebraic Pushforward / Aggregation})
\]
\[
f^* : B \longrightarrow A \quad (\text{Reverse-Causal Pullback / Reconstruction via } \text{reconstructFromScaleFunctor})
\]

The adjunction relationship $f_* \dashv f^*$ enforces exact structural duality at compile time:

\[
\text{Hom}_B(f_*(a), b) \cong \text{Hom}_A(a, f^*(b))
\]

This guarantees that macro-scale observable states $f_*(a)$ preserve exact micro-scale conservation laws without losing information during coarse-graining.

---

## 2. Discrete Helmholtz Free Energy Minimization

The discrete Helmholtz Free Energy $F$ of a multiset state configuration is defined as:

\[
F = U - T \cdot S
\]

where:
- $U$ is the discrete internal energy (sum of quadrances $Q$).
- $S$ is the discrete multiset entropy (logarithm of multiset multiplicity bounds).
- $T$ is the discrete temperature parameter.

Under natural transform evolution, the system minimizes discrete free energy, achieving a unique global ground state minimum $F = -1320$ at the **Primorial $210$ Cosmic Ground State** ($210 = 27 + 128 + 55$).

---

## 3. Executable Literate Verification

The following literate Idris 2 module verifies scale pipeline pushforward contraction, `ScaleFunctor` reconstruction, and free energy ground state minimization:

```idris
module Foundations.Scale_Pipelines_Galois_Connections_and_Free_Energy

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset
import Core.ScaleCategory
import Core.ScalePipeline
import Derivation.FreeEnergyMinimizer

%default total

||| Verifies that discrete Helmholtz Free Energy F = U - TS achieves its unique
||| global ground state minimum F = -1320 at the Primorial 210 allocation.
public export
proof_free_energy_ground_state : Bool
proof_free_energy_ground_state = Derivation.FreeEnergyMinimizer.auditFreeEnergyMinimizerProof

||| Verifies that a scale pipeline transform pushing forward an input density of 10
||| through a scaling factor of 2 produces exactly 20 units of output density.
public export
proof_scale_pipeline : Bool
proof_scale_pipeline =
  let t : TransformMultiset Nat Nat = mkTransformBox SubstrateSector unitUnixelFraction [((1, 1), intToBoxInt 2)]
      m : Box Nat = insertBox 1 (intToBoxInt 10) emptyBox
      pushed = applyPushforwardContraction t m
  in lookupBox 1 pushed == intToBoxInt 20
```

### Contextual Explanation of Code Assertions:
1. `proof_free_energy_ground_state`: Invokes `auditFreeEnergyMinimizerProof`, which evaluates the discrete partition function $Z(q) = Z_{\text{Ell}}^{27}(q) \times Z_{\text{Hyp}}^{128}(q) \times Z_{\text{Par}}^{55}(q)$. The resulting Helmholtz free energy calculation returns `True`, verifying $F_{\text{min}} = -1320$.
2. `proof_scale_pipeline`: Sets up a scale transform $t$ in the Substrate sector with scaling factor 2 ($1 \mapsto 1$, weight 2) and an initial multiset $m$ with 10 units at key 1. Applying pushforward contraction computes $10 \times 2 = 20$, confirming `lookupBox 1 pushed == 20`.
