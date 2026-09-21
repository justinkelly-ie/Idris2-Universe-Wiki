# 📋 Type Signatures & API Catalog

This document provides an **automatically generated, authoritative reference** for all data types, records, type aliases, and primary state transitions in `FinSc-Universe`.

> [!NOTE]
> This catalog is generated dynamically from the codebase source files via `Scripts/generate_type_catalog.py`.

---

## <a id="table-of-contents"></a>📑 Table of Contents

- [**1. Core Foundations & Data Structures**](#section-1)
  - [`Core.BoxInt`](#mod-core-boxint)
  - [`Core.Multiset`](#mod-core-multiset)
  - [`Core.MultisetTree`](#mod-core-multisettree)
  - [`Core.OnSeq`](#mod-core-onseq)
  - [`Core.Polynomial`](#mod-core-polynomial)
  - [`Core.Polynumber`](#mod-core-polynumber)
  - [`Core.UnixelFraction`](#mod-core-unixelfraction)
  - [`Core.VexelMaxel`](#mod-core-vexelmaxel)
- [**2. Spacetime, Geometries & Metrics**](#section-2)
  - [`Derivation.PureGeometricClassifier`](#mod-derivation-puregeometricclassifier)
  - [`Geometry.GaloisCurvature`](#mod-geometry-galoiscurvature)
  - [`Geometry.GrassmannCalculus`](#mod-geometry-grassmanncalculus)
  - [`Geometry.InformationGeometry`](#mod-geometry-informationgeometry)
  - [`Geometry.LatticeTopology`](#mod-geometry-latticetopology)
  - [`Math.FourGeometries`](#mod-math-fourgeometries)
  - [`Math.LinAlgebra.BilinearProduct`](#mod-math-linalgebra-bilinearproduct)
  - [`Math.LinAlgebra.MetricTensor`](#mod-math-linalgebra-metrictensor)
  - [`Math.LinAlgebra.TernaryClassifier`](#mod-math-linalgebra-ternaryclassifier)
- [**3. Cosmological State & Linear Evolution**](#section-3)
  - [`Evolution.Bootstrap`](#mod-evolution-bootstrap)
  - [`Evolution.Contraction`](#mod-evolution-contraction)
  - [`Evolution.Expansion`](#mod-evolution-expansion)
  - [`Evolution.Init`](#mod-evolution-init)
  - [`Evolution.LinearPipeline`](#mod-evolution-linearpipeline)
  - [`Evolution.ProtocolChannel`](#mod-evolution-protocolchannel)
  - [`Evolution.ReplEngine`](#mod-evolution-replengine)
  - [`Evolution.State`](#mod-evolution-state)
  - [`Evolution.StructuralAccounting`](#mod-evolution-structuralaccounting)
  - [`Evolution.Thermodynamics`](#mod-evolution-thermodynamics)
  - [`Evolution.ThreeMetricEvolution`](#mod-evolution-threemetricevolution)
  - [`Evolution.ToricSyndrome`](#mod-evolution-toricsyndrome)
  - [`Evolution.UniverseApp`](#mod-evolution-universeapp)
- [**4. Emergent Physical Laws & Gauge Theories**](#section-4)
  - [`Math.HolonomyPhase`](#mod-math-aharonovbohmholonomy)
  - [`Math.CliffordAlgebra`](#mod-math-cliffordalgebra)
  - [`Math.ConstructiveBaryogenesis`](#mod-math-constructivebaryogenesis)
  - [`Math.DensityMatrix`](#mod-math-densitymatrix)
  - [`Math.ActionPrinciple`](#mod-math-discreteactionprinciple)
  - [`Math.Magnetohydrodynamics`](#mod-math-discretealfvénmhd)
  - [`Math.SuperconductingGap`](#mod-math-discretebcssuperconductivity)
  - [`Math.OscillatingReactions`](#mod-math-discretebelousovzhabotinsky)
  - [`Math.QuantumPotential`](#mod-math-discretebohmianpotential)
  - [`Math.ThermalDistribution`](#mod-math-discreteboltzmanndistribution)
  - [`Math.VacuumDispersion`](#mod-math-discretecasimireffect)
  - [`Math.RetardedDipoleForce`](#mod-math-discretecasimirpolder)
  - [`Math.DegeneracyMassLimit`](#mod-math-discretechandrasekharlimit)
  - [`Math.TopologicalGaugeMass`](#mod-math-discretechernsimonsmass)
  - [`Math.ChiralAnomaly`](#mod-math-discretechiralanomaly)
  - [`Math.CosmicGenesis`](#mod-math-discretecosmicgenesis)
  - [`Math.FluctuationTheorem`](#mod-math-discretecrookstheorem)
  - [`Math.RelativisticSpinor`](#mod-math-discretediracspinor)
  - [`Math.FlavorMixing`](#mod-math-discreteflavormixing)
  - [`Math.HallViscosity`](#mod-math-discretehallviscosity)
  - [`Math.BlackHolePhaseTransition`](#mod-math-discretehawkingpagetransition)
  - [`Math.HorizonRadiation`](#mod-math-discretehawkingradiation)
  - [`Math.ActionPotentialKinetics`](#mod-math-discretehodgkinhuxley)
  - [`Math.HolographicBound`](#mod-math-discreteholographicbound)
  - [`Math.HydrogenBonding`](#mod-math-discretehydrogenbonding)
  - [`Math.PeakBindingEnergy`](#mod-math-discreteiron56peakbinding)
  - [`Math.PhaseInvarianceMeasure`](#mod-math-discretejarlskoginvariant)
  - [`Math.WorkFreeEnergyEquality`](#mod-math-discretejarzynskiequality)
  - [`Math.CavityQuantumElectrodynamics`](#mod-math-discretejaynescummings)
  - [`Math.RotatingSpacetime`](#mod-math-discretekerrspacetime)
  - [`Math.MultiTerminalConduction`](#mod-math-discretelandauerbuettiker)
  - [`Math.InformationErasureCost`](#mod-math-discretelandauerprinciple)
  - [`Math.LatticeFluidTransport`](#mod-math-discretelatticeboltzmann)
  - [`Math.MacromolecularChirality`](#mod-math-discretemacromolecularchirality)
  - [`Math.EnzymeKinetics`](#mod-math-discretemichaelismenten)
  - [`Math.AllostericCooperativity`](#mod-math-discretemonodwymanchangeux)
  - [`Math.ReciprocalTransport`](#mod-math-discreteonsagerreciprocity)
  - [`Math.EvaporationEntropyCurve`](#mod-math-discretepagecurve)
  - [`Math.PlasmaRecombination`](#mod-math-discreteplasmarecombination)
  - [`Math.ElectromagneticEnergyFlow`](#mod-math-discretepoyntingtheorem)
  - [`Math.StringTension`](#mod-math-discreteqcdstringtension)
  - [`Math.QuantumTeleportation`](#mod-math-discretequantumteleportation)
  - [`Math.RationalKepler`](#mod-math-discreterationalkepler)
  - [`Math.RationalRefraction`](#mod-math-discreterationalsnell)
  - [`Math.RibosomalTranslation`](#mod-math-discreteribosomaltranslation)
  - [`Math.EntanglementAreaLaw`](#mod-math-discreteryutakayanagi)
  - [`Math.GravitationalCollapseLimit`](#mod-math-discretetovlimit)
  - [`Math.TopologicalInsulator`](#mod-math-discretetopologicalinsulator)
  - [`Math.ToricCode`](#mod-math-discretetoriccode)
  - [`Math.TripleAlphaNucleosynthesis`](#mod-math-discretetriplealphanucleosynthesis)
  - [`Math.NucleicAcidBasePairing`](#mod-math-discretewatsoncrick)
  - [`Math.CosmologicalWaveEquation`](#mod-math-discretewheelerdewitt)
  - [`Math.FineStructure`](#mod-math-finestructure)
  - [`Math.FractionalQuantumHall`](#mod-math-fractionalquantumhall)
  - [`Math.GalacticRotationCurve`](#mod-math-galacticrotationcurve)
  - [`Math.GaugeSpinorCoupling`](#mod-math-gaugespinorcoupling)
  - [`Math.GravitationalWaveDynamics`](#mod-math-gravitationalwavedynamics)
  - [`Math.HelmholtzFreeEnergy`](#mod-math-helmholtzfreeenergy)
  - [`Math.Infinitesimal`](#mod-math-infinitesimal)
  - [`Math.LawAlgebra`](#mod-math-lawalgebra)
  - [`Math.MultisetMetricTensor55`](#mod-math-multisetmetrictensor55)
  - [`Math.MuonG2Anomaly`](#mod-math-muong2anomaly)
  - [`Math.NeutrinoOscillation`](#mod-math-neutrinooscillation)
  - [`Math.ExclusionPrinciple`](#mod-math-pauliexclusion)
  - [`Math.QuantumTransition`](#mod-math-quantumtransition)
  - [`Math.RGDecimator`](#mod-math-rgdecimator)
  - [`Math.RationalTrig`](#mod-math-rationaltrig)
  - [`Math.RenormalizationInformationFlow`](#mod-math-renormalizationinformationflow)
  - [`Math.PrefixCodeOptimality`](#mod-math-shannonhuffmanoptimality)
  - [`Math.SubstrateMetricTensor55`](#mod-math-substratemetrictensor55)
  - [`Math.SuperconductingFluxQuantization`](#mod-math-superconductingfluxquantization)
  - [`Math.TopologicalChernNumber`](#mod-math-topologicalchernnumber)
  - [`Math.ToroidalAstrodynamics`](#mod-math-toroidalastrodynamics)
  - [`Math.WilsonPolyhedra`](#mod-math-wilsonpolyhedra)
- [**5. Compound Structures & Chemical Networks**](#section-5)
  - [`Compound.AlphaReplication`](#mod-compound-alphareplication)
  - [`Compound.AstrophysicalAggregation`](#mod-compound-astrophysicalaggregation)
  - [`Compound.Biomolecules`](#mod-compound-biomolecules)
  - [`Compound.BiophysicalAggregation`](#mod-compound-biophysicalaggregation)
  - [`Compound.CosmicNucleosynthesis`](#mod-compound-cosmicnucleosynthesis)
  - [`Compound.ExoticMultiquark`](#mod-compound-exoticmultiquark)
  - [`Compound.GaugeBosons`](#mod-compound-gaugebosons)
  - [`Compound.HadronicConfinement`](#mod-compound-hadronicconfinement)
  - [`Compound.HadronizationEngine`](#mod-compound-hadronizationengine)
  - [`Compound.HeavyMesonAlgebra`](#mod-compound-heavymesonalgebra)
  - [`Compound.HierarchicalMatterPipeline`](#mod-compound-hierarchicalmatterpipeline)
  - [`Compound.HydrogenBonding`](#mod-compound-hydrogenbonding)
  - [`Compound.HyperonAlgebra`](#mod-compound-hyperonalgebra)
  - [`Compound.LinearEpsilonRouting`](#mod-compound-linearepsilonrouting)
  - [`Compound.MacromolecularAssembly`](#mod-compound-macromolecularassembly)
  - [`Compound.MacromolecularChirality`](#mod-compound-macromolecularchirality)
  - [`Compound.MesonAlgebra`](#mod-compound-mesonalgebra)
  - [`Compound.MolecularAggregation`](#mod-compound-molecularaggregation)
  - [`Compound.MolecularBonding`](#mod-compound-molecularbonding)
  - [`Compound.ParticleScattering`](#mod-compound-particlescattering)
  - [`Compound.PlasmaRecombination`](#mod-compound-plasmarecombination)
  - [`Compound.QuarkHadronAlgebra`](#mod-compound-quarkhadronalgebra)
  - [`Compound.StandardModel`](#mod-compound-standardmodel)
  - [`Compound.StellarNuclei`](#mod-compound-stellarnuclei)
  - [`Compound.StellarNucleosynthesis`](#mod-compound-stellarnucleosynthesis)
  - [`Compound.SymplecticIntegrator`](#mod-compound-symplecticintegrator)
  - [`Compound.TypeIndexedMultiset`](#mod-compound-typeindexedmultiset)
  - [`Compound.UniversalAlgebraTRS`](#mod-compound-universalalgebratrs)
  - [`Compound.VelocityLensing`](#mod-compound-velocitylensing)
  - [`Compound.WatsonCrickBasePairing`](#mod-compound-watsoncrickbasepairing)
- [**6. Elaborator Reflection & Invariant Macros**](#section-6)
  - [`Reflect.Auditor.Compound`](#mod-reflect-auditor-compound)
  - [`Reflect.Auditor.Core`](#mod-reflect-auditor-core)
  - [`Reflect.Auditor.Evolution`](#mod-reflect-auditor-evolution)
  - [`Reflect.Auditor.Geometry`](#mod-reflect-auditor-geometry)
  - [`Reflect.Auditor.Math`](#mod-reflect-auditor-math)
  - [`Reflect.Auditor.Observation`](#mod-reflect-auditor-observation)
  - [`Reflect.InvariantAuditor`](#mod-reflect-invariantauditor)
  - [`Reflect.PermutationSolver`](#mod-reflect-permutationsolver)
- [**7. Miscellaneous Modules**](#section-7)
  - [`Observation.Algebraic`](#mod-observation-algebraic)
  - [`Observation.Dataset`](#mod-observation-dataset)
  - [`Observation.HolographicStream`](#mod-observation-holographicstream)
  - [`Observation.Scientific`](#mod-observation-scientific)
  - [`Observation.Triad`](#mod-observation-triad)
  - [`TestCompoundWitness`](#mod-testcompoundwitness)

---

## <a id="section-1"></a>1. Core Foundations & Data Structures

### <a id="mod-core-boxint"></a>Module `Core.BoxInt`

#### 📦 Records

```idris
record BoxInt where
  constructor MkBoxInt
  value : Integer
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-multiset"></a>Module `Core.Multiset`

#### 📦 Records

```idris
record IntegerPartition where
  constructor MkPartition
  parts : List Multiplicity
```

```idris
record Box a where
  constructor MkBox
  items : List (a, BoxInt)
```

#### 🏷️ Algebraic Data Types

```idris
data Multiplicity : Type where
  Count : (val : Nat) -> (qty : Nat) -> Multiplicity
```

```idris
data BoxSpec : Type where
  Leaf : BoxSpec
  Node : {n : Nat} -> Vect n BoxSpec -> BoxSpec
```

```idris
data Polynumber : (0 spec : BoxSpec) -> Type where
  Zero : Polynumber Leaf
  Nest : (1 elements : Vect n (Polynumber childSpec)) -> 
         Polynumber (Node (replicate n childSpec))

||| Wildberger Natural numbers defined as multisets of empty boxes.
||| - WZero = Leaf ([]) = 0
||| - WNil  = Node []
||| - WSucc WZero WNil = Node [Leaf] ([[]]) = 1
||| - WSucc WZero (WSucc WZero WNil) = Node [Leaf, Leaf] ([[] []]) = 2
```

```idris
data WildNat : (0 spec : BoxSpec) -> Type where
  WZero : WildNat Leaf
  WNil  : WildNat (Node [])
  WSucc : {0 xs : Vect n BoxSpec} -> 
          (1 zeroElement : WildNat Leaf) -> 
          (1 rest : WildNat (Node xs)) -> 
          WildNat (Node (Leaf :: xs))

||| Tallies the physical count of empty box tokens inside a WildNat.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-multisettree"></a>Module `Core.MultisetTree`

#### 📦 Records

```idris
record TreeUniverseState where
  constructor MkTreeUniverseState
  epochNumber    : Nat
  visibleLattice : MultisetTree BoxInt
  darkEnergyROM  : MultisetTree BoxInt
  darkMatterLog  : MultisetTree BoxInt

||| Returns the total active token count across the entire TreeUniverseState:
```

#### 🏷️ Algebraic Data Types

```idris
data MultisetTree a =
    Leaf
  | Node (MultisetTree a) a Nat (MultisetTree a)
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-onseq"></a>Module `Core.OnSeq`

#### 📦 Records

```idris
record OnSeq a where
  constructor MkOnSeq
  start : Nat
  at    : Nat -> a

||| A finite consecutive subsequence (clip) extracted from an ongoing sequence.
```

```idris
record Clip a where
  constructor MkClip
  startIdx : Nat
  elements : List a
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-polynomial"></a>Module `Core.Polynomial`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-polynumber"></a>Module `Core.Polynumber`

#### 📦 Records

```idris
record PolynumberTerm where
  constructor MkPolynumberTerm
  coeff  : BoxInt
  degree : Nat
```

```idris
record Polynumber where
  constructor MkPolynumber
  coeffs : List BoxInt -- coeffs[k] is coefficient of x^k
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-unixelfraction"></a>Module `Core.UnixelFraction`

#### 📦 Records

```idris
record FractionalBox (numType : Type) where
  constructor OverUnixel
  numerator   : numType
  denominator : Unixel

||| Smart constructor for FractionalBox ensuring non-zero denominator.
```

```idris
record UnixelFraction where
  constructor MkUnixelFraction
  num : BoxInt
  den : Unixel

||| Smart constructor building a UnixelFraction with clamped non-zero denominator.
```

#### 🏷️ Algebraic Data Types

```idris
data SternBrocotBranch = BranchL | BranchR
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-core-vexelmaxel"></a>Module `Core.VexelMaxel`

#### 📦 Records

```idris
record Unixel where
  constructor MkUnixel
  index : Nat
```

```idris
record Pixel where
  constructor MkPixel
  row : Nat
  col : Nat
```

```idris
record Voxel where
  constructor MkVoxel
  axisX : Nat
  axisY : Nat
  axisZ : Nat
```

```idris
record Vexel where
  constructor MkVexel
  terms : List (Unixel, BoxInt)
```

```idris
record Maxel where
  constructor MkMaxel
  pixels : List (Pixel, BoxInt)
```

```idris
record Boxel where
  constructor MkBoxel
  voxels : List (Voxel, BoxInt)
```

```idris
record GeneBoxel where
  constructor MkGene
  codons : Boxel

||| Fundamental Amino Acids transcribed from genetic triplet codons:
||| - Methionine (AUG / [0, 1, 2] - Start Codon)
||| - Alanine (GCU / [2, 1, 0])
||| - Glycine (GGU / [2, 2, 0])
||| - Serine (UCU / [1, 1, 0])
||| - StopCodon (UAA / [1, 0, 0])
||| - UnknownAcid
```

```idris
record Tesseract where
  constructor MkTesseract
  x : Nat
  y : Nat
  z : Nat
  t : Nat
```

```idris
record HyperBoxel where
  constructor MkHyperBoxel
  cells : List (Tesseract, BoxInt)
```

```idris
record BalanceArray (n : Nat) where
  constructor MkBalanceArray
  posWeights : Vect n Nat
  negWeights : Vect n Nat
```

```idris
record MagicMaxel (n : Nat) where
  constructor MkMagicMaxel
  grid : Vect n (Vect n Nat)
```

#### 🏷️ Algebraic Data Types

```idris
data AminoAcid = Methionine | Alanine | Glycine | Serine | StopCodon | UnknownAcid
```

[↑ Back to Top](#table-of-contents)

---

## <a id="section-2"></a>2. Spacetime, Geometries & Metrics

### <a id="mod-derivation-puregeometricclassifier"></a>Module `Derivation.PureGeometricClassifier`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-geometry-galoiscurvature"></a>Module `Geometry.GaloisCurvature`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-geometry-grassmanncalculus"></a>Module `Geometry.GrassmannCalculus`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-geometry-informationgeometry"></a>Module `Geometry.InformationGeometry`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-geometry-latticetopology"></a>Module `Geometry.LatticeTopology`

#### 📦 Records

```idris
record Coord3D where
  constructor MkCoord3D
  coordX : TernaryBit
  coordY : TernaryBit
  coordZ : TernaryBit
```

#### 🏷️ Algebraic Data Types

```idris
data CardinalDir = DirEast | DirWest | DirNorth | DirSouth | DirUp | DirDown

||| Computes the adjacent face neighbor coordinate along a cardinal direction.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-fourgeometries"></a>Module `Math.FourGeometries`

#### 🏷️ Algebraic Data Types

```idris
data FundamentalGeometry = 
    EllipticGeom 
  | HyperbolicGeom 
  | ParabolicGeom 
  | SubstrateGeom
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-linalgebra-bilinearproduct"></a>Module `Math.LinAlgebra.BilinearProduct`

#### 📦 Records

```idris
record InfinitesimalStep2D where
  constructor MkStep2D
  dx : Maxel
  dy : Maxel
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-linalgebra-metrictensor"></a>Module `Math.LinAlgebra.MetricTensor`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-linalgebra-ternaryclassifier"></a>Module `Math.LinAlgebra.TernaryClassifier`

#### 🏷️ Algebraic Data Types

```idris
data TernaryBit = MinusOne | ZeroBit | PlusOne
```

```idris
data MetricSignature = 
    SigElliptic    -- det(g) > 0  (Euclidean / Matter canvas)
  | SigHyperbolic  -- det(g) < 0  (Minkowski / Causal / Symplectic)
  | SigParabolic   -- det(g) == 0 (Degenerate / Spread / Boolean)
```

[↑ Back to Top](#table-of-contents)

---

## <a id="section-3"></a>3. Cosmological State & Linear Evolution

### <a id="mod-evolution-bootstrap"></a>Module `Evolution.Bootstrap`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-contraction"></a>Module `Evolution.Contraction`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-expansion"></a>Module `Evolution.Expansion`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-init"></a>Module `Evolution.Init`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-linearpipeline"></a>Module `Evolution.LinearPipeline`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-protocolchannel"></a>Module `Evolution.ProtocolChannel`

#### 📦 Records

```idris
record PhysicsChannel (poly : Polynumber) (vm : Nat) (de : Nat) (dm : Nat) where
  constructor MkPhysicsChannel
  state : UniverseState vm de dm
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-replengine"></a>Module `Evolution.ReplEngine`

#### 🏷️ Algebraic Data Types

```idris
data ReplCommand =
    StepCmd
  | FoldCmd
  | GaloisCmd
  | LawsCmd
  | StatusCmd
  | SmCatalogCmd
  | CollideCmd String String
  | DecayCmd String
  | OscillateCmd String
  | HelpCmd
  | QuitCmd
  | UnknownCmd String

||| Parses user input string into a structured REPL command.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-state"></a>Module `Evolution.State`

#### 📦 Records

```idris
record UniverseState (vmSize : Nat) (deSize : Nat) (dmSize : Nat) where
  constructor MkUniverseState
  visibleMatter : Vect vmSize BoxInt -- Active spatial field lattice
  darkEnergy    : Vect deSize BoxInt -- Background ROM capacity
  darkMatter    : Vect dmSize BoxInt -- Historical error/residue ledger

||| Extracts the Dark Matter log as a read-only reference.
```

```idris
record CosmicMultiset where
  constructor MkCosmicMultiset
  visible    : Boxel
  darkEnergy : Maxel
  darkMatter : Vexel

||| Calculates total active state energy across the cosmic multiset.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-structuralaccounting"></a>Module `Evolution.StructuralAccounting`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-thermodynamics"></a>Module `Evolution.Thermodynamics`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-threemetricevolution"></a>Module `Evolution.ThreeMetricEvolution`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-toricsyndrome"></a>Module `Evolution.ToricSyndrome`

#### 📦 Records

```idris
record ToricSyndrome where
  constructor MkToricSyndrome
  starParity : BoxInt
  plaquetteParity : BoxInt

||| Extracts error syndromes from a 2D Maxel lattice.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-evolution-universeapp"></a>Module `Evolution.UniverseApp`

[↑ Back to Top](#table-of-contents)

---

## <a id="section-4"></a>4. Emergent Physical Laws & Gauge Theories

### <a id="mod-math-aharonovbohmholonomy"></a>Module `Math.HolonomyPhase`

#### 🏷️ Algebraic Data Types

```idris
data GaussianLink = PlusOne | PlusI | MinusOne | MinusI
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-cliffordalgebra"></a>Module `Math.CliffordAlgebra`

#### 📦 Records

```idris
record Multivector where
  constructor MkMultivector
  scalarPart   : BoxInt
  vectorPart   : Vexel
  bivectorPart : Maxel
  trivectorPart: Boxel
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-constructivebaryogenesis"></a>Module `Math.ConstructiveBaryogenesis`

#### 📦 Records

```idris
record BaryonState where
  constructor MkBaryonState
  baryonPos    : BoxInt
  baryonNeg    : BoxInt
  photonTokens : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-densitymatrix"></a>Module `Math.DensityMatrix`

#### 📦 Records

```idris
record DensityMatrix (poly : Polynumber) where
  constructor MkDensityMatrix
  normFactor : BoxInt
  coefficients : List BoxInt

||| Constructs a DensityMatrix from a reflected Polynumber generating function.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteactionprinciple"></a>Module `Math.ActionPrinciple`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretealfvénmhd"></a>Module `Math.Magnetohydrodynamics`

#### 📦 Records

```idris
record PlasmaState where
  constructor MkPlasma
  magneticFieldFlux : BoxInt
  massDensity       : BoxInt
  fluidVelocity     : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretebcssuperconductivity"></a>Module `Math.SuperconductingGap`

#### 📦 Records

```idris
record DiscreteBCSState where
  constructor MkBCSState
  ||| Debye cutoff energy tokens (ω_D)
  debyeEnergy : BoxInt
  ||| Pairing coupling strength tokens (V_0)
  couplingStrength : BoxInt
  ||| Electronic density of states tokens (N_0)
  densityOfStates : BoxInt
  ||| Cooper pair condensation energy gap tokens (Δ_0)
  energyGap : BoxInt
  ||| Ground state condensation energy saving (E_cond < 0)
  condensationEnergy : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretebelousovzhabotinsky"></a>Module `Math.OscillatingReactions`

#### 📦 Records

```idris
record BZState where
  constructor MkBZState
  activatorX : BoxInt
  inhibitorY : BoxInt
  catalystZ  : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretebohmianpotential"></a>Module `Math.QuantumPotential`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteboltzmanndistribution"></a>Module `Math.ThermalDistribution`

#### 📦 Records

```idris
record EnergyLevel where
  constructor MkEnergyLevel
  energyIndex  : Nat
  multiplicity : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretecasimireffect"></a>Module `Math.VacuumDispersion`

#### 📦 Records

```idris
record CavityBoundary where
  constructor MkCavityBoundary
  plateSeparation : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretecasimirpolder"></a>Module `Math.RetardedDipoleForce`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretechandrasekharlimit"></a>Module `Math.DegeneracyMassLimit`

#### 📦 Records

```idris
record WhiteDwarfCore where
  constructor MkWDFCore
  coreMass : BoxInt
  coreRadius : BoxInt
  degeneracyPressure : BoxInt
  gravitationalPressure : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretechernsimonsmass"></a>Module `Math.TopologicalGaugeMass`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretechiralanomaly"></a>Module `Math.ChiralAnomaly`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretecosmicgenesis"></a>Module `Math.CosmicGenesis`

#### 📦 Records

```idris
record GenesisState where
  constructor MkGenesisState
  vmTokens     : BoxInt
  deSlots      : Nat
  dmSlots      : Nat
  masterBudget : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretecrookstheorem"></a>Module `Math.FluctuationTheorem`

#### 📦 Records

```idris
record TrajectoryWork where
  constructor MkTrajectoryWork
  workForward  : BoxInt
  workBackward : BoxInt
  freeEnergyChange : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretediracspinor"></a>Module `Math.RelativisticSpinor`

#### 📦 Records

```idris
record DiracSpinor4 where
  constructor MkDiracSpinor4
  comp1 : Pixel
  comp2 : Pixel
  comp3 : Pixel
  comp4 : Pixel
```

```idris
record ChiralComponents where
  constructor MkChiralComponents
  leftHanded  : BoxInt
  rightHanded : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteflavormixing"></a>Module `Math.FlavorMixing`

#### 🏷️ Algebraic Data Types

```idris
data UpQuark = UpU | UpC | UpT
```

```idris
data DownQuark = DownD | DownS | DownB
```

```idris
data ChargedLepton = LepE | LepMu | LepTau
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretehallviscosity"></a>Module `Math.HallViscosity`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretehawkingpagetransition"></a>Module `Math.BlackHolePhaseTransition`

#### 📦 Records

```idris
record HawkingPageSystem where
  constructor MkHPSystem
  temperature : BoxInt
  critTemperature : BoxInt
  freeEnergyDifference : BoxInt
  currentPhase : GravitationalPhase
```

#### 🏷️ Algebraic Data Types

```idris
data GravitationalPhase = ThermalAdSGas | LargeAdSBlackHole
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretehawkingradiation"></a>Module `Math.HorizonRadiation`

#### 📦 Records

```idris
record HorizonState where
  constructor MkHorizonState
  horizonArea      : Nat
  blackHoleMass    : BoxInt
  emittedRadiation : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretehodgkinhuxley"></a>Module `Math.ActionPotentialKinetics`

#### 📦 Records

```idris
record NeuronMembrane where
  constructor MkNeuron
  voltage : BoxInt
  mGate   : BoxInt
  hGate   : BoxInt
  nGate   : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteholographicbound"></a>Module `Math.HolographicBound`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretehydrogenbonding"></a>Module `Math.HydrogenBonding`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteiron56peakbinding"></a>Module `Math.PeakBindingEnergy`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretejarlskoginvariant"></a>Module `Math.PhaseInvarianceMeasure`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretejarzynskiequality"></a>Module `Math.WorkFreeEnergyEquality`

#### 📦 Records

```idris
record NonEquilibriumPath where
  constructor MkNonEquilibriumPath
  pathWork   : BoxInt
  pathWeight : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretejaynescummings"></a>Module `Math.CavityQuantumElectrodynamics`

#### 📦 Records

```idris
record JCParams where
  constructor MkJCParams
  cavityFreq : BoxInt
  atomicFreq : BoxInt
  couplingStrength : BoxInt
```

```idris
record PolaritonDoublet where
  constructor MkDoublet
  photonManifold : Nat
  upperEnergy : BoxInt
  lowerEnergy : BoxInt
  rabiSplitting : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretekerrspacetime"></a>Module `Math.RotatingSpacetime`

#### 📦 Records

```idris
record KerrBlackHole where
  constructor MkKerr
  mass : BoxInt
  spin : BoxInt
  outerHorizon : BoxInt
  ergosphereRadius : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretelandauerbuettiker"></a>Module `Math.MultiTerminalConduction`

#### 📦 Records

```idris
record ConductanceMatrix3x3 where
  constructor MkConductanceMatrix3x3
  g12 : Nat
  g13 : Nat
  g21 : Nat
  g23 : Nat
  g31 : Nat
  g32 : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretelandauerprinciple"></a>Module `Math.InformationErasureCost`

#### 📦 Records

```idris
record BitMemoryState where
  constructor MkBitMemoryState
  activeBits   : Nat
  activeEnergy : BoxInt
  sinkEnergy   : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretelatticeboltzmann"></a>Module `Math.LatticeFluidTransport`

#### 📦 Records

```idris
record D2Q9Node where
  constructor MkD2Q9Node
  f0 : BoxInt
  f1 : BoxInt
  f2 : BoxInt
  f3 : BoxInt
  f4 : BoxInt
  f5 : BoxInt
  f6 : BoxInt
  f7 : BoxInt
  f8 : BoxInt
```

#### 🏷️ Algebraic Data Types

```idris
data D2Q9Dir = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretemacromolecularchirality"></a>Module `Math.MacromolecularChirality`

#### 🏷️ Algebraic Data Types

```idris
data EnantiomerHand = LHand | DHand
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretemichaelismenten"></a>Module `Math.EnzymeKinetics`

#### 📦 Records

```idris
record EnzymeSystem where
  constructor MkEnzymeSystem
  freeEnzyme    : BoxInt
  enzymeComplex : BoxInt
  substrate     : BoxInt
  product       : BoxInt
  totalEnzyme   : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretemonodwymanchangeux"></a>Module `Math.AllostericCooperativity`

#### 📦 Records

```idris
record AllostericSystem where
  constructor MkAllostericSystem
  allostericConstant : BoxInt
  affinityRatio      : BoxInt
  numProtomers       : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteonsagerreciprocity"></a>Module `Math.ReciprocalTransport`

#### 📦 Records

```idris
record TransportMatrix2x2 where
  constructor MkTransportMatrix2x2
  l11 : BoxInt
  l12 : BoxInt
  l21 : BoxInt
  l22 : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretepagecurve"></a>Module `Math.EvaporationEntropyCurve`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteplasmarecombination"></a>Module `Math.PlasmaRecombination`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretepoyntingtheorem"></a>Module `Math.ElectromagneticEnergyFlow`

#### 📦 Records

```idris
record DiscreteEMCell where
  constructor MkDiscreteEMCell
  electricEnergy : BoxInt
  magneticEnergy : BoxInt
  poyntingFluxOut: BoxInt
  jouleWork      : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteqcdstringtension"></a>Module `Math.StringTension`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretequantumteleportation"></a>Module `Math.QuantumTeleportation`

#### 📦 Records

```idris
record DiscreteQubit where
  constructor MkQubit
  alpha : BoxInt
  beta  : BoxInt
```

#### 🏷️ Algebraic Data Types

```idris
data BellSyndrome = M00 | M01 | M10 | M11
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreterationalkepler"></a>Module `Math.RationalKepler`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreterationalsnell"></a>Module `Math.RationalRefraction`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteribosomaltranslation"></a>Module `Math.RibosomalTranslation`

#### 🏷️ Algebraic Data Types

```idris
data RNABase = A | C | G | U
```

```idris
data AminoAcid = Met | Phe | Leu | Gly | Ala | StopCodon
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discreteryutakayanagi"></a>Module `Math.EntanglementAreaLaw`

#### 📦 Records

```idris
record BoundarySubsystem where
  constructor MkSubsystem
  subsystemLength : Nat
  totalBoundaryLength : Nat
```

```idris
record HolographicEntanglement where
  constructor MkHEntropy
  subsystem : BoundarySubsystem
  minimalSurfaceArea : BoxInt
  entanglementEntropy : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretetovlimit"></a>Module `Math.GravitationalCollapseLimit`

#### 📦 Records

```idris
record StellarCore where
  constructor MkStellarCore
  coreMass     : Nat
  isCollapsed  : Bool
  boundaryArea : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretetopologicalinsulator"></a>Module `Math.TopologicalInsulator`

#### 📦 Records

```idris
record DiscreteTIState where
  constructor MkTIState
  ||| Bulk energy gap tokens (E_gap)
  bulkGap : BoxInt
  ||| Bulk Z_2 parity topological index (0 = Trivial, 1 = Topological)
  bulkZ2Index : Nat
  ||| Number of protected chiral edge conduction channels (N_edge)
  edgeChannelCount : Nat
  ||| Quantized edge Hall conductance tokens (in e^2/h units)
  edgeConductance : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretetoriccode"></a>Module `Math.ToricCode`

#### 📦 Records

```idris
record ToricCodeLattice where
  constructor MkToricLattice
  gridSize : Nat
  numPhysicalQubits : Nat
  numLogicalQubits : Nat
  codeDistance : Nat
```

```idris
record StabilizerSyndrome where
  constructor MkSyndrome
  starSyndromes : List BoxInt
  plaquetteSyndromes : List BoxInt
  numAnyonDefects : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretetriplealphanucleosynthesis"></a>Module `Math.TripleAlphaNucleosynthesis`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretewatsoncrick"></a>Module `Math.NucleicAcidBasePairing`

#### 🏷️ Algebraic Data Types

```idris
data NucleotideBase = Adenine | Thymine | Guanine | Cytosine
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-discretewheelerdewitt"></a>Module `Math.CosmologicalWaveEquation`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-finestructure"></a>Module `Math.FineStructure`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-fractionalquantumhall"></a>Module `Math.FractionalQuantumHall`

#### 📦 Records

```idris
record LaughlinState where
  constructor MkLaughlinState
  fillingNumerator : Nat
  fillingDenominator : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-galacticrotationcurve"></a>Module `Math.GalacticRotationCurve`

#### 📦 Records

```idris
record GalacticProfile where
  constructor MkGalacticProfile
  coreBaryonMass : BoxInt
  diskMassSlope  : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-gaugespinorcoupling"></a>Module `Math.GaugeSpinorCoupling`

#### 📦 Records

```idris
record GaugeCoupledSpinor where
  constructor MkGaugeCoupledSpinor
  spinor      : DiracSpinor4
  gaugeCharge : BoxInt
  connectionA : (BoxInt, BoxInt, BoxInt, BoxInt)
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-gravitationalwavedynamics"></a>Module `Math.GravitationalWaveDynamics`

#### 📦 Records

```idris
record MetricShearTT where
  constructor MkMetricShearTT
  hPlus  : BoxInt
  hCross : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-helmholtzfreeenergy"></a>Module `Math.HelmholtzFreeEnergy`

#### 📦 Records

```idris
record CosmicBudgetPartition where
  constructor MkCosmicBudgetPartition
  vmTokens : BoxInt
  deTokens : BoxInt
  dmTokens : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-infinitesimal"></a>Module `Math.Infinitesimal`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-lawalgebra"></a>Module `Math.LawAlgebra`

#### 📦 Records

```idris
record GaloisConnection (a : Type) (b : Type) where
  constructor MkGaloisConnection
  fPush       : Box a -> Box b
  fPull       : Box b -> Box a
  unitBound   : Box a -> Bool  -- ma <= fPull (fPush ma)  (Expansion-after-Contraction)
  counitBound : Box b -> Bool  -- fPush (fPull mb) <= mb  (Contraction-after-Expansion)
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-multisetmetrictensor55"></a>Module `Math.MultisetMetricTensor55`

#### 📦 Records

```idris
record MetricBasisPair where
  constructor MkBasisPair
  row : Nat
  col : Nat
```

```idris
record MultisetMetricTensor55 where
  constructor MkMultisetMetricTensor55
  basisMultiset : Box MetricBasisPair
  determinant   : BoxInt

||| Smart constructor building the canonical 55-component Parabolic Substrate Multiset Metric Tensor.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-muong2anomaly"></a>Module `Math.MuonG2Anomaly`

#### 📦 Records

```idris
record MuonG2Moment where
  constructor MkMuonG2Moment
  treeLevel      : UnixelFraction  -- a_\mu^{(0)} = 0
  qedSchwinger   : UnixelFraction  -- \alpha / (2\pi) = 1 / (2 * 137) = 1 / 274
  bsmLoopDefect  : UnixelFraction  -- \Delta a_\mu^{BSM} = 1 / (137 * 210) = 1 / 28770
  totalAnomalous : UnixelFraction  -- a_\mu^{exp} = qedSchwinger + bsmLoopDefect

||| Tree-level Dirac gyromagnetic ratio prediction: g = 2 => a_\mu = 0.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-neutrinooscillation"></a>Module `Math.NeutrinoOscillation`

#### 📦 Records

```idris
record NeutrinoProbabilityVector where
  constructor MkNeutrinoProbabilityVector
  probNuE   : UnixelFraction
  probNuMu  : UnixelFraction
  probNuTau : UnixelFraction

||| Smart constructor for initial pure Electron Neutrino beam (P_e = 1, P_mu = 0, P_tau = 0).
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-pauliexclusion"></a>Module `Math.ExclusionPrinciple`

#### 🏷️ Algebraic Data Types

```idris
data FermionOccupancy = Vacant | Occupied
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-quantumtransition"></a>Module `Math.QuantumTransition`

#### 📦 Records

```idris
record DualAmplitude where
  constructor MkDualAmplitude
  real : BoxInt
  imag : BoxInt
```

```idris
record QuantumState where
  constructor MkQuantumState
  amplitudes : List (Unixel, DualAmplitude)
```

```idris
record QuantumOperator where
  constructor MkQuantumOperator
  matrix : List (Pixel, DualAmplitude)
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-rgdecimator"></a>Module `Math.RGDecimator`

#### 📦 Records

```idris
record Plaquette2x2 where
  constructor MkPlaquette2x2
  f00 : BoxInt
  f01 : BoxInt
  f10 : BoxInt
  f11 : BoxInt
```

```idris
record MacroPlaquette where
  constructor MkMacroPlaquette
  totalFlux : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-rationaltrig"></a>Module `Math.RationalTrig`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-renormalizationinformationflow"></a>Module `Math.RenormalizationInformationFlow`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-shannonhuffmanoptimality"></a>Module `Math.PrefixCodeOptimality`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-substratemetrictensor55"></a>Module `Math.SubstrateMetricTensor55`

#### 📦 Records

```idris
record SubstrateMetricTensor55 where
  constructor MkSubstrateMetricTensor55
  components : Vect 55 BoxInt
  determinant : BoxInt

||| Constructs the canonical 55-component Parabolic Substrate Metric Tensor where det(g) = 0.
```

#### 🏷️ Algebraic Data Types

```idris
data PhaseBasis10 = X1 | X2 | X3 | X4 | CR | CG | CB | S1 | S2 | S3
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-superconductingfluxquantization"></a>Module `Math.SuperconductingFluxQuantization`

#### 📦 Records

```idris
record SuperconductingLoop where
  constructor MkSuperconductingLoop
  cooperPairCharge : BoxInt
  fluxQuantumPhi0  : BoxInt
  windingNumber    : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-topologicalchernnumber"></a>Module `Math.TopologicalChernNumber`

#### 📦 Records

```idris
record TorusPlaquette where
  constructor MkTorusPlaquette
  gridX : Nat
  gridY : Nat
  berryFluxNumerator : Integer
  berryFluxDenominator : Integer
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-toroidalastrodynamics"></a>Module `Math.ToroidalAstrodynamics`

#### 📦 Records

```idris
record ToroidalPos where
  constructor MkToroidalPos
  posX : BoxInt
  posY : BoxInt
  posZ : BoxInt
  boxL : BoxInt
```

```idris
record MassToken where
  constructor MkMassToken
  mass : BoxInt
  pos  : ToroidalPos
  vel  : (BoxInt, BoxInt, BoxInt)
```

```idris
record RationalOrbit where
  constructor MkRationalOrbit
  semiMajorQuadrance : BoxInt -- Q_a = a^2
  focalQuadrance     : BoxInt -- Q_c = c^2
  orbitalPeriod      : BoxInt -- T
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-math-wilsonpolyhedra"></a>Module `Math.WilsonPolyhedra`

#### 📦 Records

```idris
record ColorState where
  constructor MkColorState
  redAmp   : DualAmplitude
  greenAmp : DualAmplitude
  blueAmp  : DualAmplitude
```

```idris
record WilsonPolyhedron where
  constructor MkWilsonPolyhedron
  faceEast  : QuantumOperator -- +X face
  faceWest  : QuantumOperator -- -X face
  faceNorth : QuantumOperator -- +Y face
  faceSouth : QuantumOperator -- -Y face
  faceUp    : QuantumOperator -- +Z face
  faceDown  : QuantumOperator -- -Z face
```

[↑ Back to Top](#table-of-contents)

---

## <a id="section-5"></a>5. Compound Structures & Chemical Networks

### <a id="mod-compound-alphareplication"></a>Module `Compound.AlphaReplication`

#### 📦 Records

```idris
record NuclearCluster (k : Nat) where
  constructor MkNuclearCluster
  nucleons : Vect k HadronState

||| Flattens a NuclearCluster into a contiguous (k * 27)-cell Visible Matter vector.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-astrophysicalaggregation"></a>Module `Compound.AstrophysicalAggregation`

#### 📦 Records

```idris
record MassToken where
  constructor MkMassToken
  tokenId : Nat
```

```idris
record StellarRemnant where
  constructor MkStellarRemnant
  massMultiset : Box MassToken
  totalTokens  : Nat
  remnantClass : RemnantType
```

#### 🏷️ Algebraic Data Types

```idris
data RemnantType = WhiteDwarf | NeutronStar | BlackHole
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-biomolecules"></a>Module `Compound.Biomolecules`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-biophysicalaggregation"></a>Module `Compound.BiophysicalAggregation`

#### 📦 Records

```idris
record DnaBasePair where
  constructor MkBasePair
  strand1 : NucleotideBase
  strand2 : NucleotideBase
```

```idris
record DnaDoubleHelix where
  constructor MkDnaDoubleHelix
  pairsMultiset  : Box DnaBasePair
  totalHBonds    : Nat

||| A Peptide Chain consists of a multiset of amino acids and its condensed mass tokens.
```

```idris
record PeptideChain where
  constructor MkPeptideChain
  aminoMultiset : Box EnantiomerHand
  netMassTokens : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-cosmicnucleosynthesis"></a>Module `Compound.CosmicNucleosynthesis`

#### 🏷️ Algebraic Data Types

```idris
data LightNucleusSpec = Deuteron2H | Triton3H | Helium3He | Lithium7Li
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-exoticmultiquark"></a>Module `Compound.ExoticMultiquark`

#### 🏷️ Algebraic Data Types

```idris
data ExoticMultiquarkSpec = TetraquarkX3872 | PentaquarkPcPlus | HDibaryon
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-gaugebosons"></a>Module `Compound.GaugeBosons`

#### 🏷️ Algebraic Data Types

```idris
data GluonIndex = G1_RedAntiGreen | G2_RedAntiBlue | G3_GreenAntiRed 
                | G4_GreenAntiBlue | G5_BlueAntiRed | G6_BlueAntiGreen 
                | G7_NeutralDiag1 | G8_NeutralDiag2
```

```idris
data ElectroweakBoson = WPlusBoson | WMinusBoson | ZZeroBoson | PhotonBoson
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-hadronicconfinement"></a>Module `Compound.HadronicConfinement`

#### 📦 Records

```idris
record HadronState where
  constructor MkHadronState
  latticeGrid : Vect 27 BoxInt

||| Creates a balanced Hadronic Ground State at Epoch 3.
||| Injects 1 unit of Quark flux into each cell (9 Red + 9 Green + 9 Blue = 27 total flux).
```

#### 🏷️ Algebraic Data Types

```idris
data ColorCharge = RedColor | GreenColor | BlueColor
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-hadronizationengine"></a>Module `Compound.HadronizationEngine`

#### 📦 Records

```idris
record HadronizedJetState where
  constructor MkHadronizedJetState
  hadrons  : List StandardModelParticle
  qgpPhase : QGPPhase
```

#### 🏷️ Algebraic Data Types

```idris
data QGPPhase = QuarkGluonPlasma | HadronGasTransition | ConfinementHadronGas
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-heavymesonalgebra"></a>Module `Compound.HeavyMesonAlgebra`

#### 🏷️ Algebraic Data Types

```idris
data HeavyMesonSpec = JPsiCharmonium | UpsilonBottomonium 
                     | DPlus | DZero | DsPlus 
                     | BPlus | BZero | BsZero
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-hierarchicalmatterpipeline"></a>Module `Compound.HierarchicalMatterPipeline`

#### 🏷️ Algebraic Data Types

```idris
data MatterPhase = PhaseQuarkHadronic     -- 1. Quarks to Nucleons (9 -> 27)
                 | PhaseNuclearAlpha       -- 2. Nucleons to Helium-4 Alpha Cores (27 -> 108)
                 | PhaseStellarNucleo      -- 3. Triple-Alpha to Carbon-12 & Phosphorus (108 -> 324)
                 | PhasePlasmaAtomic       -- 4. Recombination & Photon Decoupling
                 | PhaseMolecularBonding   -- 5. Covalent Bonds & Aqueous Networks (H2O)
                 | PhaseBioenergeticATP    -- 6. Pyrophosphate ATP Coupling (Ground State 210)
                 | PhaseMacromolecularDNA  -- 7. Homochiral Watson-Crick Base Pairing
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-hydrogenbonding"></a>Module `Compound.HydrogenBonding`

#### 📦 Records

```idris
record HydrogenBond where
  constructor MkHydrogenBond
  donorAtom    : Nat
  hydrogenAtom : Nat
  acceptorAtom : Nat
  energyTenths : Nat -- Energy in 1/10ths of covalent single bond (typically 1-2 tenths)
```

```idris
record WaterCluster (n : Nat) where
  constructor MkWaterCluster
  waterCount : Nat
  hBondCount : Nat
  hBondMaxel : Maxel

||| Tetrahedral Water Hexamer (6 H2O molecules in hexagonal/tetrahedral liquid percolation).
||| In a fully coordinated liquid network, each H2O participates in up to 4 H-bonds (2 donor, 2 acceptor).
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-hyperonalgebra"></a>Module `Compound.HyperonAlgebra`

#### 🏷️ Algebraic Data Types

```idris
data HyperonSpec = LambdaZero | SigmaPlus | SigmaZero | SigmaMinus 
                 | XiZero | XiMinus | OmegaMinus | LambdaCharmPlus
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-linearepsilonrouting"></a>Module `Compound.LinearEpsilonRouting`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-macromolecularassembly"></a>Module `Compound.MacromolecularAssembly`

#### 🏷️ Algebraic Data Types

```idris
data MacromoleculeSpec = LipidBilayerMembrane | RNADoubleHelix | CatalyticEnzymeComplex | Iron56HeavyNucleus
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-macromolecularchirality"></a>Module `Compound.MacromolecularChirality`

#### 📦 Records

```idris
record SignedVoxel where
  constructor MkSignedVoxel
  sX : BoxInt
  sY : BoxInt
  sZ : BoxInt
```

```idris
record AminoAcidMonomer where
  constructor MkAminoAcidMonomer
  monomerName     : String
  monomerFormula  : String
  carbonCount     : Nat
  hydrogenCount   : Nat
  nitrogenCount   : Nat
  oxygenCount     : Nat
  chirality       : Chirality
```

```idris
record Dipeptide where
  constructor MkDipeptide
  dipeptideName    : String
  dipeptideFormula : String
  carbonCount      : Nat
  hydrogenCount    : Nat
  nitrogenCount    : Nat
  oxygenCount      : Nat
  isHomochiral     : Bool
  chirality        : Chirality
```

#### 🏷️ Algebraic Data Types

```idris
data Chirality = LeftHanded | RightHanded | Achiral
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-mesonalgebra"></a>Module `Compound.MesonAlgebra`

#### 🏷️ Algebraic Data Types

```idris
data MesonSpec = PionPlus | PionMinus | PionZero | KaonPlus | KaonMinus | KaonZero
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-molecularaggregation"></a>Module `Compound.MolecularAggregation`

#### 📦 Records

```idris
record AtomicElement where
  constructor MkAtomicElement
  atomicNumber : Nat
  massTokens   : BoxInt
  electrons    : Nat
```

```idris
record Molecule where
  constructor MkMolecule
  atomMultiset : Box AtomicElement
  quadreaA     : BoxInt
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-molecularbonding"></a>Module `Compound.MolecularBonding`

#### 📦 Records

```idris
record CovalentBond where
  constructor MkCovalentBond
  atom1 : Nat
  atom2 : Nat
  order : Nat

||| Converts a list of covalent bonds into a pure Maxel adjacency matrix.
```

```idris
record Molecule (numAtoms : Nat) where
  constructor MkMolecule
  formula     : String
  elements    : Vect numAtoms Element
  bondMatrix  : Maxel

||| Total valence requirement across all constituent atoms in the molecule.
```

```idris
record Coord3D where
  constructor MkCoord3D
  cx : BoxInt
  cy : BoxInt
  cz : BoxInt
```

```idris
record Molecule3D where
  constructor MkMolecule3D
  name  : String
  atoms : Boxel
  bonds : Maxel

||| 3D Conformation of Methane (CH4) centered at [1, 1, 1] on the discrete 3x3x3 grid:
||| - Carbon at [1, 1, 1] (Z=6)
||| - Hydrogen 1 at [2, 2, 2] (Z=1)
||| - Hydrogen 2 at [2, 0, 0] (Z=1)
||| - Hydrogen 3 at [0, 2, 0] (Z=1)
||| - Hydrogen 4 at [0, 0, 2] (Z=1)
```

#### 🏷️ Algebraic Data Types

```idris
data Element = Hydrogen | Carbon | Nitrogen | Oxygen
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-particlescattering"></a>Module `Compound.ParticleScattering`

#### 📦 Records

```idris
record MandelstamInvariants where
  constructor MkMandelstamInvariants
  sVar : UnixelFraction
  tVar : UnixelFraction
  uVar : UnixelFraction

||| Computes Mandelstam invariants for 2-to-2 scattering with total invariant mass bounds.
||| Verifies the Mandelstam identity: s + t + u = \sum_{i=1}^4 m_i^2.
```

```idris
record ScatteringEvent2To2 where
  constructor MkScatteringEvent2To2
  inParticle1  : StandardModelParticle
  inParticle2  : StandardModelParticle
  outParticle1 : StandardModelParticle
  outParticle2 : StandardModelParticle
  kinematics   : MandelstamInvariants
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-plasmarecombination"></a>Module `Compound.PlasmaRecombination`

#### 📦 Records

```idris
record PlasmaCell where
  constructor MkPlasmaCell
  protons   : Nat
  electrons : Nat
```

```idris
record DecoupledGas where
  constructor MkDecoupledGas
  neutralAtoms     : Nat
  decoupledPhotons : Nat
  residualProtons  : Nat
  residualElectrons: Nat
```

#### 🏷️ Algebraic Data Types

```idris
data ParticleCharge = ProtonPositive | ElectronNegative | NeutralHydrogen
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-quarkhadronalgebra"></a>Module `Compound.QuarkHadronAlgebra`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-standardmodel"></a>Module `Compound.StandardModel`

#### 📦 Records

```idris
record ParticleQuantumNumbers where
  constructor MkParticleQuantumNumbers
  charge      : UnixelFraction -- Electric Charge Q
  spin        : UnixelFraction -- Spin S
  isospin     : UnixelFraction -- Weak Isospin I_3
  hypercharge : UnixelFraction -- Weak Hypercharge Y = 2(Q - I_3)
  baryonNum   : UnixelFraction -- Baryon Number B
  leptonNum   : UnixelFraction -- Lepton Number L
```

#### 🏷️ Algebraic Data Types

```idris
data Fermion =
    QuarkU | QuarkD | QuarkC | QuarkS | QuarkT | QuarkB
  | AntiQuarkU | AntiQuarkD | AntiQuarkC | AntiQuarkS | AntiQuarkT | AntiQuarkB
  | LepE | LepNuE | LepMu | LepNuMu | LepTau | LepNuTau
  | AntiLepE | AntiLepNuE | AntiLepMu | AntiLepNuMu | AntiLepTau | AntiLepNuTau
```

```idris
data Boson =
    Photon
  | WPlus | WMinus | ZZero
  | Gluon1 | Gluon2 | Gluon3 | Gluon4 | Gluon5 | Gluon6 | Gluon7 | Gluon8
  | Higgs0
```

```idris
data StandardModelParticle =
    SMPFermion Fermion
  | SMPBoson Boson
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-stellarnuclei"></a>Module `Compound.StellarNuclei`

#### 🏷️ Algebraic Data Types

```idris
data StellarNucleusSpec = Beryllium7 | Boron8 | Neon20 | Magnesium24 | Silicon28 | Iron56
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-stellarnucleosynthesis"></a>Module `Compound.StellarNucleosynthesis`

#### 📦 Records

```idris
record Carbon12Nucleus where
  constructor MkCarbon12Nucleus
  alphaCount  : Nat
  totalVoxels : Nat
  protons     : Nat
  neutrons    : Nat
```

#### 🏷️ Algebraic Data Types

```idris
data StellarElement =
    ElemH   -- Hydrogen (Z=1, Valence=1)
  | ElemHe  -- Helium (Z=2, Valence=0, Alpha Core)
  | ElemC   -- Carbon (Z=6, Valence=4, Triple-Alpha)
  | ElemN   -- Nitrogen (Z=7, Valence=3, CNO Cycle)
  | ElemO   -- Oxygen (Z=8, Valence=2, Alpha Capture on Carbon)
  | ElemNe  -- Neon (Z=10, Valence=0, Alpha Capture on Oxygen)
  | ElemMg  -- Magnesium (Z=12, Valence=2, Alpha Capture on Neon)
  | ElemSi  -- Silicon (Z=14, Valence=4, Alpha Capture on Magnesium)
  | ElemP   -- Phosphorus (Z=15, Valence=5, Polyphosphate Backbone)
  | ElemFe  -- Iron (Z=26, Valence=2, Silicon Burning Peak)
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-symplecticintegrator"></a>Module `Compound.SymplecticIntegrator`

#### 📦 Records

```idris
record PhaseState where
  constructor MkPhaseState
  position : Vexel
  momentum : Vexel
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-typeindexedmultiset"></a>Module `Compound.TypeIndexedMultiset`

#### 📦 Records

```idris
record RefinedQuark (spec : QuarkSpec) (col : ColorSector) where
  constructor MkRefinedQuark
  vexelCarrier : QuarkVexel
  0 tokenProof : (case vexelCarrier of
                    MkVexel [(MkUnixel c, w)] => c == colorToNat col && w == intToBoxInt 9
                    _ => False) = True

||| Refined Hadron: 3D Boxel (27 mass tokens) with verified color neutrality.
```

```idris
record RefinedHadron (spec : HadronSpec) where
  constructor MkRefinedHadron
  boxelCarrier : HadronBoxel
  0 specProof  : (spec == spec) = True

||| Refined Alpha Particle (4He Core): 3D Boxel (108 mass tokens).
```

```idris
record RefinedAlpha (spec : AlphaSpec) where
  constructor MkRefinedAlpha
  alphaBoxelCarrier : Boxel
  0 alphaSpecProof  : (spec == spec) = True

||| Refined Carbon-12 Nucleus: 324 tokens governed by Triple-Alpha Balance.
```

```idris
record RefinedNucleus (spec : NucleusSpec) where
  constructor MkRefinedNucleus
  nucleusTokens     : BoxInt
  0 tokenCountProof : (nucleusTokens == intToBoxInt 324) = True
```

#### 🏷️ Algebraic Data Types

```idris
data ScaleTag = QuarkScale | HadronScale | AlphaScale | NucleusScale | MoleculeScale

||| Quark Flavor Specification (6 Standard Model Flavors).
```

```idris
data QuarkSpec = UpQuark | DownQuark | StrangeQuark | CharmQuark | BottomQuark | TopQuark
```

```idris
data LeptonSpec = ElectronLepton | MuonLepton | TauLepton 
                | ElectronNeutrino | MuonNeutrino | TauNeutrino
```

```idris
data ColorSector = ColorRed | ColorGreen | ColorBlue
```

```idris
data HadronSpec = ProtonSpec | NeutronSpec
```

```idris
data AlphaSpec = Helium4Core
```

```idris
data NucleusSpec = Carbon12Core
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-universalalgebratrs"></a>Module `Compound.UniversalAlgebraTRS`

#### 🏷️ Algebraic Data Types

```idris
data LeptonKind = Electron | Positron | Neutrino | AntiNeutrino
```

```idris
data PionCharge = PionPlus | PionZero | PionMinus
```

```idris
data ElementKind = ElemH | ElemHe | ElemC | ElemN | ElemO | ElemP
```

```idris
data MatterTerm : Type where
  ||| Empty vacuum term (zero tokens).
  TermVoid : MatterTerm
  ||| Primitive 1D Quark term carrying flavor and color slice (9 tokens).
  TermQuark : (flavor : QuarkSpec) -> (color : ColorSector) -> MatterTerm
  ||| 2D Meson / Pion strong interaction carrier (18 tokens).
  TermPion : (charge : PionCharge) -> MatterTerm
  ||| Fundamental Lepton (Electron, Positron, Neutrino).
  TermLepton : (kind : LeptonKind) -> MatterTerm
  ||| Electroweak Gauge Boson / Decoupled Photon (0 mass, 0 charge).
  TermPhoton : MatterTerm
  ||| 3D Hadron composite term (Proton or Neutron, 27 tokens).
  TermHadron : (isProton : Bool) -> MatterTerm
  ||| 2-Nucleon Deuteron Nucleus (54 tokens).
  TermDeuteron : MatterTerm
  ||| 4-Nucleon Alpha Cluster / Helium-4 Core (108 tokens).
  TermAlpha : MatterTerm
  ||| Intermediate Beryllium-8 Nucleus (216 tokens).
  TermBeryllium8 : MatterTerm
  ||| Heavy Carbon-12 Nucleus (324 tokens).
  TermCarbon12 : MatterTerm
  ||| Heavy Oxygen-16 Nucleus (432 tokens).
  TermOxygen16 : MatterTerm
  ||| Phosphorus-31 Nucleus (837 tokens).
  TermPhosphorus31 : MatterTerm
  ||| Neutral Atom (Bound Nucleus + Electron Cloud, 0 net charge).
  TermAtom : (element : ElementKind) -> MatterTerm
  ||| Covalent Water Molecule (H2O, 486 fundamental tokens = 18 amu).
  TermWater : MatterTerm
  ||| Bioenergetic ATP Pyrophosphate Complex (210 Ground State Budget).
  TermATP : MatterTerm
  ||| Homochiral Watson-Crick DNA Base Pair (GC or AT).
  TermDNAPair : (isGC : Bool) -> MatterTerm
  ||| Binary multiset composition / parallel union (⊎).
  TermUnion : MatterTerm -> MatterTerm -> MatterTerm
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-velocitylensing"></a>Module `Compound.VelocityLensing`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-compound-watsoncrickbasepairing"></a>Module `Compound.WatsonCrickBasePairing`

#### 📦 Records

```idris
record ATPMolecule where
  constructor MkATPMolecule
  phosphateGroups : Nat -- 3 (Alpha, Beta, Gamma)
  phosphoAnhydrideBonds : Nat -- 2 high-energy P-O-P bonds

||| Canonical ATP ground state.
```

```idris
record HydrolysisResult where
  constructor MkHydrolysisResult
  adpPhosphates : Nat -- 2
  inorganicPhosphate : Nat -- 1
  energyTokensReleased : Nat -- Discrete thermodynamic drive (30 kJ/mol equivalent)

||| Executes ATP Hydrolysis: Cleaves 1 phosphoanhydride bond, releasing 1 Pi and energy.
```

#### 🏷️ Algebraic Data Types

```idris
data Nucleobase = Adenine | Thymine | Guanine | Cytosine | Uracil
```

[↑ Back to Top](#table-of-contents)

---

## <a id="section-6"></a>6. Elaborator Reflection & Invariant Macros

### <a id="mod-reflect-auditor-compound"></a>Module `Reflect.Auditor.Compound`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-auditor-core"></a>Module `Reflect.Auditor.Core`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-auditor-evolution"></a>Module `Reflect.Auditor.Evolution`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-auditor-geometry"></a>Module `Reflect.Auditor.Geometry`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-auditor-math"></a>Module `Reflect.Auditor.Math`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-auditor-observation"></a>Module `Reflect.Auditor.Observation`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-invariantauditor"></a>Module `Reflect.InvariantAuditor`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-reflect-permutationsolver"></a>Module `Reflect.PermutationSolver`

[↑ Back to Top](#table-of-contents)

---

## <a id="section-7"></a>7. Miscellaneous Modules

### <a id="mod-observation-algebraic"></a>Module `Observation.Algebraic`

#### 📦 Records

```idris
record AlgebraicObservation where
  constructor MkAlgebraicObservation
  lawIndex    : Nat
  lawName     : String
  geometry    : FundamentalGeometry
  isConserved : Bool
  budgetClaim : Nat
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-observation-dataset"></a>Module `Observation.Dataset`

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-observation-holographicstream"></a>Module `Observation.HolographicStream`

#### 📦 Records

```idris
record HolographicStream where
  constructor MkHolographicStream
  boundaryArea : BoxInt
  evaporationBitstream : List BoxInt

||| Reads out the boundary bitstream from a black hole horizon.
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-observation-scientific"></a>Module `Observation.Scientific`

#### 📦 Records

```idris
record ScientificObservation where
  constructor MkScientificObservation
  quantityName         : String
  associatedLaw        : Nat
  exactTheory          : UnixelFraction
  measuredLower        : UnixelFraction
  measuredUpper        : UnixelFraction
  unitDimension        : String
  experimentalCitation : String
  experimentalDOI      : String
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-observation-triad"></a>Module `Observation.Triad`

#### 📦 Records

```idris
record ObservationTriad where
  constructor MkObservationTriad
  triadName        : String
  carrierMultiset  : List (String, Nat)
  algebraicLaw     : AlgebraicObservation
  scientificData   : ScientificObservation
```

[↑ Back to Top](#table-of-contents)

---

### <a id="mod-testcompoundwitness"></a>Module `TestCompoundWitness`

[↑ Back to Top](#table-of-contents)

---
