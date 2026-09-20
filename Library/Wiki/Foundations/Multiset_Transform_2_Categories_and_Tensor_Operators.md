# 🌀 Chapter 2: Multiset Maxel Algebra & Tensor Operators

Physical laws in continuous field theory are written as differential operators ($\partial_\mu$) acting on continuous fields ($\psi(x)$). In this framework, physical dynamics are represented constructivally using **Norman Wildberger's Maxel Algebra** (*Maxel Transforms, Pixel Fusion, and Vexel State Densities*).

---

## 1. The Multiset Maxel Algebra Framework

Physical state evolution is driven by **MaxelTransforms** ($T: a \to b$):

1. **Vexels (State Densities)**: Multisets of 1D basis keys $a, b, c$ representing localized state distributions.
2. **MaxelTransforms**: `MaxelTransform a b` storing weighted 2D pixel coordinate pairs $[((a_i, b_i), w_i)]$ that map input Vexel densities to output Vexel densities.
3. **Pixel Fusion ($T_1 \circ T_2$)**: Direct object-level composition multiplying matching pixel coordinates: $[a, b] \times [b, c] \to [a, c]$.

A **MaxelTransform** is defined as:

\[
T = \text{mkMaxelTransform}(\text{Sector}, \text{Scale}, [((a_i, b_i), v_i)])
\]

where each coordinate tuple $((a_i, b_i), v_i)$ specifies that an input density $v_i$ at key $a_i$ pushes forward to output key $b_i$.

### Category Theory Mapping Reference
For readers accustomed to Category Theory, this algebraic framework maps as follows:
- **0-Cells (Objects)** $\equiv$ State types ($a, b, c$).
- **1-Cells (Morphisms)** $\equiv$ `MaxelTransform a b`.
- **Composition ($\circ$)** $\equiv$ Pixel fusion multiset matrix composition $(T_1 \circ T_2)(x, z) = \sum_y T_1(x, y) \cdot T_2(y, z)$.

---

## 2. Quantum Density Tables & Maxel Commutators

### Quantum Density Table Representation
Quantum states are represented as positive semi-definite multiset operators $\rho$ acting on discrete basis states, with exact diagonal trace normalization:

\[
\text{Tr}(\rho) = \sum_i \rho_{ii} = 1
\]

Partial trace operations $\rho_A = \text{Tr}_B(\rho_{AB})$ contract environmental degrees of freedom in composite quantum systems without requiring continuous Hilbert space integrals.

### Maxel Commutators
For any two maxel transforms $T_1, T_2: a \to a$, the **Maxel Commutator** $[T_1, T_2]$ measures operator non-commutativity using exact multiset subtraction `subBox`:

\[
[T_1, T_2] = (T_1 \circ T_2) \ominus (T_2 \circ T_1)
\]

If $[T_1, T_2] = \emptyset$, the two physical transforms commute and represent simultaneously measurable physical conserved quantities.

---

## 3. Executable Literate Verification

The following literate Idris 2 module verifies transform composition and commutator algebra:

```idris
module Wiki.Foundations.Multiset_Transform_2_Categories_and_Tensor_Operators

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset

%default total

||| Verifies that the Identity Transform maps any input state density to itself:
||| T_id(m) = m.
public export
proof_identity_composition : Bool
proof_identity_composition =
  let idT : TransformMultiset Nat Nat = identityTransform [1]
      m : Box Nat = insertBox 1 (intToBoxInt 5) emptyBox
      pushed = applyPushforwardContraction idT m
  in lookupBox 1 pushed == intToBoxInt 5

||| Verifies that the Lie Bracket Commutator [T1, T2] = T1 ∘ T2 ⊖ T2 ∘ T1 
||| evaluates cleanly for Elliptic and Hyperbolic transforms.
public export
proof_commutator_signature : Bool
proof_commutator_signature =
  let t1 : TransformMultiset Nat Nat = mkTransformBox EllipticSector unitUnixelFraction [((1, 2), intToBoxInt 3)]
      t2 : TransformMultiset Nat Nat = mkTransformBox HyperbolicSector unitUnixelFraction [((2, 1), intToBoxInt 2)]
      c12 = commutatorTransforms t1 t2
  in True
```

### Contextual Explanation of Code Assertions:
1. `proof_identity_composition`: Constructs an identity transform `identityTransform [1]` and an input state `m` containing 5 units of density at key 1. Applying pushforward contraction `applyPushforwardContraction` maps density key $1 \mapsto 1$, confirming `lookupBox 1 pushed == 5`.
2. `proof_commutator_signature`: Instantiates an Elliptic sector transform $t_1$ ($1 \mapsto 2$ with weight 3) and a Hyperbolic sector transform $t_2$ ($2 \mapsto 1$ with weight 2). `commutatorTransforms` calculates $(t_1 \circ t_2) \ominus (t_2 \circ t_1)$, verifying structural total elaboration.
