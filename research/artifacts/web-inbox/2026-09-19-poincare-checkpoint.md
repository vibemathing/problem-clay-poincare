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

## Statement boundary of the new theorem

The audited theorem identifies the canonical colimit of the fundamental
groupoids of an open cover, closed under nonempty finite intersections, with
the ambient fundamental groupoid. It is a genuine many-set groupoid
Seifert--van Kampen theorem.

It does not assume simple connectivity of the ambient space or cover pieces,
and it does not assume the colimit conclusion.

## Active downstream bridge

The active exact-pin verifier candidate is now
`vibemathing/vibe-mathing-cn-public@55bf5f799958e7c56eaa7843c6db976e375205b3`.

It isolates two no-placeholder downstream statements:

- if a diagram has a colimit whose apex has subsingleton hom-sets and the same
  diagram has a test cocone whose chosen leg is faithful, then the corresponding
  diagram groupoid has subsingleton hom-sets;
- applying that bridge to the audited full groupoid Van Kampen colimit transfers
  ambient `SimplyConnectedSpace` to a path-connected cover member once such a
  faithful test-cocone leg is supplied.

The earlier provisional based-transport/two-cover experiment was removed from
the verifier harness because its failed elaboration generated downstream
`sorryAx` noise.  The active candidate itself contains no `sorry` or
`admit`.  Its exact-pin workflow run `35414071269` is still in progress at
this checkpoint, so these two new statements are not yet listed as trusted
delta.

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
  `55bf5f799958e7c56eaa7843c6db976e375205b3`
- active faithful-leg exact-pin workflow run: `35414071269`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

CLAIM_BOUNDARY: The root three-dimensional Poincare theorem is not proved.
The newly trusted claim is limited to the exact-pin full groupoid Van Kampen
colimit theorem and its recorded standard axiom dependencies.
