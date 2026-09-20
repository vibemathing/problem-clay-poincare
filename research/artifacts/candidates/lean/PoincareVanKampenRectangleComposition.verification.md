# Verification note — PoincareVanKampenRectangleComposition

Artifact: `research/artifacts/candidates/lean/PoincareVanKampenRectangleComposition.lean`

Status: candidate-only recovery of an externally kernel-checked payload. It is not an admitted Result.

## Exact verification environment

The source in the paired `.lean` file is the generated Lean payload from diagnostic harness commit:

- repository: `vibemathing/vibe-mathing-cn-public`
- harness commit: `4be3da32e3df0090cb9ed5464117378a25248d71`
- script: `diagnostics/run-hatcher-rectangle-composition.sh`
- upstream Hatcher source: `frenzymath/Poincare-Conjecture@bb91a091f0b968f8bbe8d861e025a88d82b161be`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`
- GitHub Actions run: `35202078253`
- job: `105138974033`
- conclusion: `success`

The job rebuilt the relevant Hatcher Van Kampen chain and then ran:

```text
lake build HatcherLib.Ch1.PoincareVanKampenRectangleComposition
lake env lean -j1 HatcherLib/Ch1/PoincareVanKampenRectangleComposition.lean
```

The build completed successfully with 3046 jobs.

## Kernel-visible declarations and axiom audit

The successful run printed the following declarations with the same axiom set:

```text
HatcherLib.VanKampenSweepRow.composable_of_ofFn_adjacent
HatcherLib.VanKampenSquareGrid.sweepRows
HatcherLib.VanKampenSquareGrid.sweepRows_composable
HatcherLib.VanKampenSquareGrid.sweepRows_rectangle_equiv
```

For each declaration, `#print axioms` reported exactly:

```text
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` appeared in the successful run for these declarations.

The same run also replayed the previously obtained support declarations
`VanKampenSquareGrid.sweepRow` and
`VanKampenSquareGrid.sweepRow_top_equiv_next_bottom`, again with only
`propext`, `Classical.choice`, and `Quot.sound`.

## Mathematical scope

`sweepRows_rectangle_equiv` proves the whole adapted-grid rectangle sweep:
its `rectangleInput` factor word is equivalent to its `rectangleOutput` factor
word, assuming triple intersections of the cover are path connected.

This closes the finite-row assembly layer that previously remained open.

It does **not** yet identify the rectangle's outer frontier words with the two
original Van Kampen factorization words. That outer-boundary glue is the next
Hatcher-route obligation.

It also does not supply the connected-sum geometric cover, punctured-manifold
fundamental-group preservation, or the sphere connected-sum homeomorphism.

## Parallel full-groupoid route status

A separate exact-pin replay of the WIP Mathlib groupoid-colimit Van Kampen source
(`hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`) progressed through
most modules, including `ComposeMorphisms`, but the full `IsColimit` target still
failed in two files in run `35201967397`:

- `SingleCoveredSimple.lean`: dependent functor/object transport and final
  `eqToHom` reassociation under Lean 4.33 transparency;
- `UniquenessProofs.lean`: two identity-sandwich normalization steps for
  fundamental-groupoid morphisms.

That route therefore remains a candidate, not a verified full Van Kampen theorem
on the mission pin.

## Trust boundary

This external CI receipt establishes only that the recorded Hatcher rectangle
payload elaborated and passed the Lean kernel in the stated pinned environment,
with the printed axiom dependencies above. It does not independently verify
statement faithfulness for the full Poincaré conjecture and does not close the
root mission.
