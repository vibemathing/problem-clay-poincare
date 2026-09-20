# Mathlib infrastructure survey for a Poincaré proof route — 2026-09-17

Verdict: `candidate_only` source/code survey. This note records observed search results and does not prove global nonexistence of an implementation.

## Positive infrastructure observed

Current Mathlib contains substantial manifold and Riemannian-metric infrastructure, including:

- `Mathlib/Topology/VectorBundle/Riemannian.lean` — `RiemannianMetric` and continuous bundle metrics;
- `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean` — smooth/`ContMDiff` Riemannian metrics;
- `Mathlib/Geometry/Manifold/Riemannian/Basic.lean` — `IsRiemannianManifold` and the induced metric/topology layer;
- topological manifolds, charted spaces, fundamental groupoids, simple connectivity, homotopy equivalences, homeomorphisms, and sphere manifold instances.

This means a future geometric-analysis route is not starting from zero at the level of basic manifolds and bundle metrics.

## Missing-route signals observed by repository code search

The following searches against the Mathlib repository default branch returned no relevant implementation hits:

- `RicciFlow`
- `Ricci flow`
- `RiemannCurvature`
- `connectedSum` for manifold connected sums
- `triangulation manifold`

A search for `Moise` returned only an author name in an unrelated graph-theory file, not Moise's 3-manifold triangulation/smoothing theorem.

A search for `Perelman` returned the Poincaré `proof_wanted` statement/comment, not a Perelman/Ricci-flow proof development.

## Consequence for route selection

The direct Perelman route currently appears to require major new formal infrastructure beyond existing Mathlib's basic Riemannian-manifold layer. At minimum, a faithful implementation would need explicit formal objects/theorems corresponding to the analytic/geometric chain actually used in a proof, rather than introducing the desired conclusion as an axiom.

A smooth-route implementation also needs a proved topological-to-smooth bridge for arbitrary topological 3-manifolds; no Moise theorem implementation was located by this survey.

A decomposition route would need manifold connected-sum/prime-decomposition infrastructure; no corresponding `connectedSum` implementation was located by this survey.

## Search-boundary warning

These are code-search observations, not a proof that no relevant theorem exists anywhere in Mathlib or external Lean projects. Follow-up work must inspect exact candidate modules, external formalization repositories, and pinned revisions before promoting any absence claim.

## Immediate route implication

The cheapest falsifiable next steps are:

1. continue constructing/compiling the exact target layer with minimal imports;
2. search external Lean topology/formalization projects for reusable 3-manifold and sphere-recognition infrastructure;
3. identify the smallest missing theorem chain between current Mathlib and a mathematically complete Poincaré proof, preserving each gap as an explicit obligation.
