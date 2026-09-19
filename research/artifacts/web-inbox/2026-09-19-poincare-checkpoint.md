# Poincare research checkpoint — 2026-09-19 +08:00

ROOT_STATUS: OPEN

## Trusted delta

1. The full WIP groupoid Seifert--van Kampen development from
   `hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`
   now builds on the mission's exact target pin.
2. Fresh verifier run `35369169071`, job `105678780716`, completed the
   `Mathlib.AlgebraicTopology.FundamentalGroupoid.VanKampen.IsColimit`
   target successfully.
3. A second fresh verifier run `35370133496`, job `105681881079`, again
   completed all 8737 build jobs and then performed theorem-level axiom audits.
4. `#print axioms` reported exactly
   `[propext, Classical.choice, Quot.sound]` for:
   - `my_canonicalCocone_isColimit`
   - `van_kampen_groupoid_main`
   - `uniqueness_full`
   No `sorryAx` was reported.
5. All 36 Lean source files in the pinned upstream `VanKampen/` directory
   were scanned for `sorry`, `admit`, top-level custom `axiom`, and unsafe
   theorem/lemma/def declarations. The scan found zero matches.
6. The exact receipt has been persisted as
   `research/artifacts/candidates/lean/PoincareVanKampenGroupoidColimit.verification.md`.

## Additional trusted support — two-open intersection family

Exact-pin verifier branch `tmp-poincare-three-open-cover-target-pin-20260919`
at commit `e63cc008dbb51286764585e56bb20cf1a721a7c9` passed workflow
run `35452934173`, job `105923129258`.

The verified candidate defines the finite cover family `{U, V, U ⊓ V}` and
proves binary-intersection closure, pointwise covering when `U ⊔ V = ⊤`,
and closure under every nonempty finite intersection.  The latter is exactly
the combinatorial `hfinite_intersections` shape required by the audited full
groupoid Van Kampen theorem.

`#print axioms` for all three checked lemmas reported exactly
`[propext, Classical.choice, Quot.sound]`; no `sorryAx` appeared.

Persisted artifacts:

- `research/artifacts/candidates/lean/PoincareTwoOpenIntersectionFamily.lean`
- `research/artifacts/candidates/lean/PoincareTwoOpenIntersectionFamily.verification.md`

## Statement boundary of the new theorem

The audited theorem identifies the canonical colimit of the fundamental
groupoids of an open cover, closed under nonempty finite intersections, with
the ambient fundamental groupoid. It is a genuine many-set groupoid
Seifert--van Kampen theorem.

It does not assume simple connectivity of the ambient space or cover pieces,
and it does not assume the colimit conclusion.

## Active downstream bridge

The active faithful-leg verifier candidate is now
`vibemathing/vibe-mathing-cn-public@8967293aeef81fb4f1d8a712e7587d868b3c701b`.
It avoids direct projection of a bundled `Grpd` functor equality: the
colimit-factor composite is first transferred a `Faithful` instance using
`hc.fac`, after which its `map_injective` is applied. Its exact-pin run
`35453120857` is still in progress, so the faithful-leg theorem is not yet
trusted.

A separate lightweight based-transport probe is active on branch
`tmp-poincare-based-transport-target-pin-20260919`, commit
`b57d5e381d14c7e2bdaf534bb4e947526b9788cb`, workflow run
`35453211777`.  This isolates the prospective faithful functor from a
connected groupoid to the single-object category of a vertex group.

## Next connected-sum obligations

The full Van Kampen infrastructure removes the previous kernel-equality
external assumption, but the connected-sum factor theorem still needs:

1. a faithful test cocone for the three-open family
   `{U, V, U ∩ V}` when the overlap is simply connected;
2. transfer from thinness of the factor fundamental groupoid plus
   `PathConnectedSpace` to `SimplyConnectedSpace`;
3. an actual collar/open-cover model for `OpenGA.ConnectedSum.Space`;
4. the punctured-manifold comparison needed to identify the cover pieces with
   the original closed factors.

The pinned Mathlib theorem
`simply_connected_iff_paths_homotopic` already supplies item 2 once
subsingleton fundamental-groupoid hom-sets are available.

## Independent remaining root obligations

Even after connected-sum factor simple-connectivity is closed, the root mission
still requires the sphere connected-sum homeomorphism, the global
three-manifold/geometrization or Ricci-surgery chain, and the
topological-to-smooth bridge needed by the selected proof route.

OpenGA's existing
`simply_connected_factors_of_connected_sum` remains explicitly `by sorry`;
the current work does not import that result as an axiom.

## Recoverable state

- target repository recovery branch: `web/attempt-poincare-bootstrap`
- verifier PR #13 branch:
  `tmp-poincare-vankampen-target-pin-20260917`
- successful audited harness commit:
  `e594df5e800fe18bd9ff28e31d27ebada7eb5f56`
- active faithful-leg candidate commit:
  `8967293aeef81fb4f1d8a712e7587d868b3c701b`
- active faithful-leg exact-pin workflow run: `35453120857`
- active based-transport branch:
  `tmp-poincare-based-transport-target-pin-20260919`
- active based-transport commit:
  `b57d5e381d14c7e2bdaf534bb4e947526b9788cb`
- active based-transport run: `35453211777`
- trusted three-open-family verifier commit:
  `e63cc008dbb51286764585e56bb20cf1a721a7c9`
- trusted three-open-family run/job: `35452934173` / `105923129258`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

CLAIM_BOUNDARY: The root three-dimensional Poincare theorem is not proved.
The newly trusted claim is limited to the exact-pin full groupoid Van Kampen
colimit theorem and its recorded standard axiom dependencies.
