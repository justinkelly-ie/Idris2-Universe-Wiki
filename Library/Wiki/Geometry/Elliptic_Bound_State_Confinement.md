# 🌐 Elliptic Metric Domain: Bound State Confinement ($27$ VM, $\det g = +1$)

The **Elliptic Metric Sector** is defined by a positive metric determinant ($\det g = +1$) and governs bound-state confinement, positive action ($Q > 0$), and spacelike geometric structures.

---

## 1. Physical Law & Primorial Allocation

In constructive multiset physics, bound states (such as quarks confined inside hadrons, atomic binding energy, and stable orbital nuclei) cannot dissipate into spatial infinity. They are confined within the **Elliptic Sector**:

- **Metric Determinant**: $\det g = +1$
- **Primorial Allocation**: 27 Vexel-Maxels (VM)
- **Physical Signature**: Positive action $Q > 0$, spacelike quadratic forms, and finite bound-state energy levels.

The 27 Vexel-Maxels represent the fundamental degree of freedom budget allocated to hadronic sub-constituents ($3 \times 3 \times 3 = 27$ color-flavor triality combinations).

---

## 2. Executable Literate Verification

The following literate Idris 2 module verifies multiset pushforward contraction under Elliptic confinement:

```idris
module Wiki.Geometry.Elliptic_Bound_State_Confinement

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset

%default total

||| Verifies that an Elliptic transform (det g = +1) confines an input unit density
||| into a triple-weight bound state density (lookupBox 1 pushed == 3).
public export
evidence_elliptic_confinement : Bool
evidence_elliptic_confinement =
  let t : TransformMultiset Nat Nat = mkTransformBox EllipticSector unitUnixelFraction [((1, 1), intToBoxInt 3)]
      m : Box Nat = insertBox 1 (intToBoxInt 1) emptyBox
      pushed = applyPushforwardContraction t m
  in lookupBox 1 pushed == intToBoxInt 3
```

### Contextual Explanation of Code Assertions:
1. `evidence_elliptic_confinement`: Constructs an Elliptic sector transform $t$ with mapping $(1 \mapsto 1, v = 3)$ and an initial state $m$ containing 1 unit of density at key 1.
2. `applyPushforwardContraction t m`: Contracts the state under Elliptic geometry, scaling the density by 3.
3. `lookupBox 1 pushed == intToBoxInt 3`: Confirms that the resulting confined state density is exactly 3, returning `True`.
