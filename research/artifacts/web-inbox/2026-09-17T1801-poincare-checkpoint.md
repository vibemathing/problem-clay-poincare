# Poincaré research checkpoint — 2026-09-17 18:01 +08:00

ROOT_STATUS: OPEN

## Trusted delta this turn

1. Fresh target-repository bootstrap was re-read from `main`.
   `problem:clay-poincare` remains `draft / preview_unadmitted`; the canonical
   `attempts.jsonl` and `obligation-graphs.jsonl` are still empty. This is an
   admission-state blocker, not evidence about the mathematical truth of the
   conjecture.
2. The exact-pin Hatcher Van Kampen rectangle replay completed successfully:
   external run `35202078253`, job `105138974033`, harness commit
   `4be3da32e3df0090cb9ed5464117378a25248d71`.
3. The exact tested source was persisted in this target repository as
   `research/artifacts/candidates/lean/PoincareVanKampenRectangleComposition.lean`.
4. The paired verification note records environment, commands, theorem names,
   axiom output, limitations, and the parallel full-groupoid failure state.

## Newly verified formal sublayer

Under Lean `4.33.0`, Mathlib
`db584cd6d46c92f209a44c0f1c829460d327499d`, and
`frenzymath/Poincare-Conjecture@bb91a091f0b968f8bbe8d861e025a88d82b161be`, the following declarations built successfully:

- `HatcherLib.VanKampenSweepRow.composable_of_ofFn_adjacent`
- `HatcherLib.VanKampenSquareGrid.sweepRows`
- `HatcherLib.VanKampenSquareGrid.sweepRows_composable`
- `HatcherLib.VanKampenSquareGrid.sweepRows_rectangle_equiv`

`#print axioms` for each reported only:

```text
[propext, Classical.choice, Quot.sound]
```

The run also replayed the previously verified row-level declarations
`VanKampenSquareGrid.sweepRow` and
`VanKampenSquareGrid.sweepRow_top_equiv_next_bottom` with the same axiom set.

## What this closes

The finite row-assembly layer of the Hatcher adapted-grid proof is now closed at
the exact mission pin: all geometric rows compose into a single rectangle sweep,
and the rectangle input/output factor words are Van Kampen-word equivalent.

## Decisive remaining Hatcher-route obligation

The next missing theorem is outer-boundary identification:

- identify the bottom/top horizontal frontier words of the full rectangle with
  the original two factorization words induced by the homotopic ambient loops;
- eliminate/cancel the left/right vertical boundary connector words, using the
  fixed-endpoint homotopy boundary conditions plus the existing change-cover and
  word-calculus lemmas.

Once this is proved, the route can remove the currently external
`vanKampen_ker = ...` assumption from the simple-connectivity corollary and expose
an actual many-set Van Kampen kernel theorem suitable for a connected-sum cover.

## Parallel full-groupoid route

The exact-pin replay of the WIP groupoid-colimit Van Kampen implementation
(`hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`) now compiles
`ComposeMorphisms` and most of the development, but run `35201967397` still
fails in:

- `SingleCoveredSimple.lean`: dependent functor/object equality transport and a
  final `eqToHom` reassociation;
- `UniquenessProofs.lean`: two identity-sandwich normalization steps.

This remains a useful alternate route, but has no full `IsColimit` receipt yet.

## Root-level blockers after Van Kampen

Even a completed Van Kampen layer is only one dependency of the connected-sum
endgame. Remaining independent obligations include:

- a genuine open collar/cover model for the connected sum;
- path/simple connectivity of the overlap in the dimension-three use case;
- proof that deleting the chosen coordinate 3-ball preserves the needed
  fundamental-group information;
- a formal homeomorphism `S³ # S³ ≃ₜ S³` compatible with the connected-sum
  construction used by the proof;
- the much larger global three-manifold/Poincaré chain (including any smoothing,
  geometrization, Ricci-flow/surgery, or replacement route) with no new axioms.

## Admission-state blocker

The repository's canonical `main` still has no admitted Attempt/Route/Obligation
packet. Its own router therefore restricts fresh work to discovery/candidate
state until trusted admission updates the canonical records. This checkpoint and
paired Lean candidate stay strictly under candidate-writable paths and make no
Result/Evidence admission claim.

## Exact continuation point

1. Start from `sweepRows_rectangle_equiv` in the saved candidate.
2. Prove the bottom/top frontier identification from `horizontalCut_zero`,
   `horizontalCut_one`, and the homotopy endpoint equations.
3. Prove left/right frontier connector cancellation from fixed endpoints.
4. Compose these with `VanKampenWordEquivalent.append/trans/symm` to obtain the
   original-factor-word equivalence.
5. Re-run exact-pin Lean verification and print axioms before promoting any
   further statement.

CLAIM_BOUNDARY: The root Poincaré theorem is not proved. The new positive claim is
limited to the exact Hatcher rectangle-sweep declarations listed above in the
recorded pinned environment.
