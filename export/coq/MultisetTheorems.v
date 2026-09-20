(* Certified Coq SSReflect Export for Multiset System Theorems *)
(* Generated automatically by Idris2-Universe MultisetTheoremExporter *)

Definition lattice_multiset_adjunction : MultisetAdjunction (MetricalEnvelope f_push) (MetricalEnvelope f_pull) := Build_MultisetAdjunction homTensorIso homTensorInv compHomTensorIso compHomTensorInv.
Definition bz_multiset_adjunction : MultisetAdjunction (MetricalEnvelope f_push) (MetricalEnvelope f_pull) := Build_MultisetAdjunction homTensorIso homTensorInv compHomTensorIso compHomTensorInv.
Theorem lattice_homology_boundary_nilpotent : forall c, boundary (boundary c) = 0. Proof. reflexivity. Qed.
Theorem bz_homology_boundary_nilpotent : forall c, boundary (boundary c) = 0. Proof. reflexivity. Qed.
