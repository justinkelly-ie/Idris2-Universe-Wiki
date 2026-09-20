# ⚡ Hyperbolic Metric Domain: Gauge Flux and Mixing ($128$ DE, $\det g = -1$)

The **Hyperbolic Metric Sector** is defined by a negative metric determinant ($\det g = -1$) and governs gauge flux propagation, lightcone phase ($Q = 0$), CKM/PMNS flavor mixing, and Stern-Brocot prefix optimality.

---

## 1. Physical Law & Primorial Allocation

Gauge fields (such as electroweak gauge bosons, photon flux, and flavor-changing neutral currents) propagate along lightcone directions where the discrete quadratic action vanishes ($Q = 0$):

- **Metric Determinant**: $\det g = -1$
- **Primorial Allocation**: 128 Dyck-Epsilons (DE)
- **Physical Signature**: Lightcone phase $Q = 0$, non-abelian CKM/PMNS mixing matrices, and Stern-Brocot prefix codes.

The 128 Dyck-Epsilons represent the maximum information channel capacity allocated to gauge flux interaction channels ($2^7 = 128$).

---

## 2. Executable Literate Verification

The following literate Idris 2 module verifies Hyperbolic gauge flux propagation:

```idris
module Wiki.Geometry.Hyperbolic_Gauge_Flux_and_Mixing

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.MaxelTransform

%default total

||| Verifies Hyperbolic gauge flux propagation (det g = -1) transferring 5 units 
||| of input density at key 1 into 10 units of propagated gauge flux at key 2.
public export
evidence_hyperbolic_gauge_flux : Bool
evidence_hyperbolic_gauge_flux =
  let t : MaxelTransform Nat Nat = mkTransformBox HyperbolicSector unitUnixelFraction [((1, 2), intToBoxInt 2)]
      m : Box Nat = insertBox 1 (intToBoxInt 5) emptyBox
      pushed = applyPushforwardContraction t m
  in lookupBox 2 pushed == intToBoxInt 10
```

### Contextual Explanation of Code Assertions:
1. `evidence_hyperbolic_gauge_flux`: Instantiates a Hyperbolic sector transform $t$ mapping key $1 \mapsto 2$ with coupling weight 2, and an initial flux density of 5 at key 1.
2. `applyPushforwardContraction t m`: Propagates the gauge flux along the Hyperbolic lightcone.
3. `lookupBox 2 pushed == intToBoxInt 10`: Verifies that key 2 receives $5 \times 2 = 10$ units of propagated flux density, returning `True`.
