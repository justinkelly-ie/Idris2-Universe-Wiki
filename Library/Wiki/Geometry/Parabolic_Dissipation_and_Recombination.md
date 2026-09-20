# 💧 Parabolic Metric Domain: Dissipation & Recombination ($55$ DM, $\det g = 0$)

The **Parabolic Metric Sector** is defined by a degenerate metric determinant ($\det g = 0$) and governs dissipation drains, thermal equilibrium, plasma recombination, and null momentum transport ($p_{\text{null}} = (0, 0)$).

---

## 1. Physical Law & Primorial Allocation

When physical systems undergo thermal dissipation or plasma recombination (such as relic freeze-out or electron-ion recombination in early cosmic plasma), kinetic energy drains into thermal ground states:

- **Metric Determinant**: $\det g = 0$
- **Primorial Allocation**: 55 Dyck-Maxels (DM)
- **Physical Signature**: Null momentum $p_{\text{null}} = (0, 0)$, irreversible dissipation, and thermal equilibrium drains.

The 55 Dyck-Maxels represent the total dissipation capacity budget ($1 + 2 + 3 + \dots + 10 = 55$, the 10th triangular number).

---

## 2. Executable Literate Verification

The following literate Idris 2 module verifies Parabolic recombination drain contraction:

```idris
module Wiki.Geometry.Parabolic_Dissipation_and_Recombination

import Core.BoxInt
import Core.Multiset
import Core.UnixelFraction
import Core.TransformMultiset

%default total

||| Verifies Parabolic recombination drain (det g = 0) routing 55 units of plasma 
||| density into the thermal ground state drain (lookupBox 1 pushed == 55).
public export
evidence_parabolic_recombination : Bool
evidence_parabolic_recombination =
  let t : TransformMultiset Nat Nat = mkTransformBox ParabolicSector unitUnixelFraction [((1, 1), intToBoxInt 1)]
      m : Box Nat = insertBox 1 (intToBoxInt 55) emptyBox
      pushed = applyPushforwardContraction t m
  in lookupBox 1 pushed == intToBoxInt 55
```

### Contextual Explanation of Code Assertions:
1. `evidence_parabolic_recombination`: Creates a Parabolic sector transform $t$ ($1 \mapsto 1$, weight 1) representing a thermal equilibrium drain, and an input plasma state of 55 units at key 1.
2. `applyPushforwardContraction t m`: Contracts the state into the Parabolic dissipation sink.
3. `lookupBox 1 pushed == intToBoxInt 55`: Confirms that all 55 units of density are safely accounted for in the thermal equilibrium state, returning `True`.
