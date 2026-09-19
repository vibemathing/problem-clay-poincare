# Verification note — full groupoid Van Kampen colimit

Status: candidate-only recovery of an externally kernel-checked infrastructure theorem.
This is not an admitted Result and is not a proof of the Poincare conjecture.

## Exact source and target environment

- upstream WIP source: `hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`
- overlaid directory only:
  `Mathlib/AlgebraicTopology/FundamentalGroupoid/VanKampen/`
- verifier repository: `vibemathing/vibe-mathing-cn-public`
- verifier branch: `tmp-poincare-vankampen-target-pin-20260917`
- successful axiom-audit harness commit:
  `e594df5e800fe18bd9ff28e31d27ebada7eb5f56`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`
- successful audit run: `35370133496`
- audit job: `105681881079`
- conclusion: `success`

A preceding fresh GitHub Actions run `35369169071`, job `105678780716`,
also completed the full exact-pin build successfully before the axiom-audit
step was added.

## Full build receipt

The successful audit run rebuilt the complete target and reported:

```text
[8737/8737] Built Mathlib.AlgebraicTopology.FundamentalGroupoid.VanKampen.IsColimit
Build completed successfully (8737 jobs).
```

The replay uses compatibility-only Lean 4.33 elaboration patches
(`backward.isDefEq.respectTransparency false` in the files whose older
proof scripts relied on more permissive definitional equality, plus removal of
tactics that became superfluous after simplification). These patches do not add
mathematical hypotheses, axioms, or replacement theorem statements.

## Kernel-visible declarations and axiom audit

The successful run executed `#print axioms` for:

```text
my_canonicalCocone_isColimit
van_kampen_groupoid_main
uniqueness_full
```

The exact output for each declaration was:

```text
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` appeared in these theorem-level audits.

## Source-level hole scan

All 36 Lean files in the pinned upstream
`FundamentalGroupoid/VanKampen/` directory were scanned for:

- `sorry`
- `admit`
- top-level custom `axiom`
- `unsafe def`, `unsafe theorem`, or `unsafe lemma`

The scan found zero matches in all 36 files.

This source scan is supplemental evidence. The theorem-level `#print axioms`
output above is the decisive reachable-dependency audit for the recorded
declarations.

## Mathematical statement boundary

`my_canonicalCocone_isColimit` constructs an `IsColimit` witness for the
canonical cocone of fundamental groupoids associated to an open cover closed
under nonempty finite intersections.

`van_kampen_groupoid_main` packages this into the groupoid Seifert--van
Kampen conclusion: the colimit of the cover diagram is equivalent to the
ambient `FundamentalGroupoid X`.

The theorem does not assume the Van Kampen conclusion, simple connectivity of
the ambient space, or simple connectivity of the cover pieces.

Two upstream helper declarations named
`path_decomposition_eq_comp_list_general` and
`path_decomposition_eq_comp_list` have proposition `True`; they are not
kernel holes and the audited final declarations still have only the standard
axioms listed above. They should not be mistaken for mathematical content or
used as evidence beyond the reachable audited theorem dependency.

## What this closes

This closes the previously failing full-groupoid Van Kampen infrastructure
replay at the mission's exact Lean/Mathlib pin.

It supplies a verified colimit theorem that can now replace the earlier
external kernel-equality assumption in downstream connected-sum work, once the
needed geometric cover and a suitable factor-faithfulness corollary are
formalized.

## What remains open

This receipt does not prove that a simply connected connected sum has simply
connected factors. The next formal obligations include:

1. a categorical factor bridge from a thin colimit apex plus a faithful
   test-cocone leg to thinness of the corresponding cover groupoid;
2. construction of that faithful test cocone for a two-set cover with simply
   connected overlap;
3. an actual open collar cover of `ConnectedSum.Space` and the required
   punctured-manifold fundamental-group comparison;
4. `S^3 # S^3 \simeq S^3` for the connected-sum construction used by the
   proof;
5. the global three-manifold/geometrization/Ricci-surgery and
   topological-to-smooth bridges required by the root Poincare theorem.

## Trust boundary

This note records a real exact-pin kernel-checked groupoid Van Kampen theorem
and its standard axiom dependencies. It establishes infrastructure only.
ROOT_STATUS remains OPEN.
