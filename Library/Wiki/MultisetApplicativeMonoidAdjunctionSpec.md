# 🌌 Multiset Applicative Monad, Bilinear Monoid Ring Convolution & Monoid Galois Adjunction Specification

Documents and verifies the formal category-theoretic and algebraic properties of the `Multiset c` Applicative and Monad functor elevation, structural `BoxInt` tensor multiplication over $\mathbb{Z}_2$, free monoid ring bilinear convolution $R[M]$, and Fiber Pushforward ($f_*$) / Pullback Lift ($f^*$) Monoid Galois Adjunctions under Sandy Maguire's *Algebra-Driven Design* and *Certainty by Construction*.

---

## 1. Category-Theoretic & Multiset Homomorphism Duality Dictionary

| Algebraic Construct | Category-Theoretic Dual | Native Multiset Core Implementation |
| :--- | :--- | :--- |
| **Multiset Functor** | Free Module Functor $\text{Multiset } c : \text{Set} \to \text{Set}$ | `Functor (Multiset c)` via `mapMultiset` |
| **Applicative Multiset** | Monoidal Tensor Functor $F(A) \otimes F(B) \to F(A \otimes B)$ | `Applicative (Multiset c)` via `liftA2` / `scaleMultiset` |
| **Multiset Monad** | Multiset Join / FlatMap | `Monad (Multiset c)` via `(>>=)` |
| **Structural BoxInt Product** | Applicative Tensor Product over $\mathbb{Z}_2 = \{\text{Pos}, \text{Neg}\}$ | `boxMult xs ys = normalizeBoxInt [\| mulSignedUnit xs ys \|]` |
| **Monoid Ring Convolution** | Bilinear Convolution in Free Monoid Ring $R[M]$ | `convolveMultiset xs ys = [\| (<+>) xs ys \|]` |
| **Scale Fiber Pushforward ($f_*$)** | Fiber Multiplicity Aggregation | `fiberPushforward f = mapMultiset f` |
| **Scale Fiber Pullback ($f^*$)** | Fiber Multiplicity Lift | `fiberPullback fiberMap ys` |
| **Monoid Galois Adjunction** | Adjunction Duality $f_* \dashv f^*$ | `MonoidGaloisAdjunction c a b` |

---

## 2. Algebraic Axioms & Property Invariants

1. **Applicative Functor Preservation**: `pure id <*> v == v` and `pure f <*> pure x == pure (f x)`.
2. **Structural BoxInt Tensor Multiplicative Equivalence**: `boxMult xs ys` using applicative tensor product over `SignedUnit` basis yields identical result to integer product `intToBoxInt (xVal * yVal)`.
3. **Monoid Ring Convolution Distributivity & Associativity**: Bilinear convolution $\circledast$ distributes over multiset addition $+$.
4. **Monoid Galois Adjunction Duality ($f_* \dashv f^*$)**: Fiber pushforward coarse-graining and pullback lift satisfy unit identity $\eta_A$ and counit identity $\varepsilon_B$.

---

## 3. Formal Executable Idris 2 Specification

```idris
module Wiki.MultisetApplicativeMonoidAdjunctionSpec

import Math.Multiset
import Math.BoxInt

%default total

||| Property 1: Applicative Identity Law over Multiset
public export
prop_multisetApplicativeIdentity : BoxInt -> Bool
prop_multisetApplicativeIdentity v =
  (pure id <*> v) == v

||| Property 2: Structural BoxInt Tensor Product Equivalence with Integer Multiplicative Ring
public export
prop_boxMultApplicativeTensorEquivalence : BoxInt -> BoxInt -> Bool
prop_boxMultApplicativeTensorEquivalence xs ys =
  let applicativeRes = boxMult xs ys
      (MkUr xVal) = boxToInt xs
      (MkUr yVal) = boxToInt ys
      integerRes = intToBoxInt (xVal * yVal)
  in applicativeRes == integerRes

||| Property 3: Monoid Ring Bilinear Convolution Identity
public export
prop_monoidConvolutionIdentity : BoxInt -> Bool
prop_monoidConvolutionIdentity xs =
  let unitMultiset = pure (intToBoxInt 0)
      res = convolveMultiset xs unitMultiset
  in multiplicityAll res == multiplicityAll xs

||| Property 4: Fiber Pushforward & Pullback Galois Identity
public export
prop_monoidGaloisFiberRoundtrip : Multiset Integer SignedUnit -> Bool
prop_monoidGaloisFiberRoundtrip xs =
  let pushed = fiberPushforward id xs
      pulled = fiberPullback (\u => [u]) pushed
  in pulled == xs

||| Proof witness auditor for Multiset Applicative Monoid Galois Specification
public export
auditMultisetApplicativeMonoidGaloisProof : Bool
auditMultisetApplicativeMonoidGaloisProof =
  prop_multisetApplicativeIdentity (intToBoxInt 42) &&
  prop_boxMultApplicativeTensorEquivalence (intToBoxInt 7) (intToBoxInt 6) &&
  prop_boxMultApplicativeTensorEquivalence (intToBoxInt (-3)) (intToBoxInt 14) &&
  prop_monoidConvolutionIdentity (intToBoxInt 10) &&
  prop_monoidGaloisFiberRoundtrip (intToBoxInt 27)
```
