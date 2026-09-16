# Poincaré research checkpoint — 2026-09-17

ROOT_STATUS: OPEN

## Trusted delta

1. The frozen mathematical target has been recorded as the topological three-dimensional Poincaré statement.
2. A pinned Mathlib statement-identity reference was recorded without importing its `proof_wanted` as evidence.
3. Three simply-connected-space support lemmas have a real passing Lean/Mathlib CI receipt under Lean 4.33.0 and Mathlib `db584cd6d46c92f209a44c0f1c829460d327499d`.
4. The larger explicit target-layer probe has a real negative resource receipt: Lean was terminated by signal 6 under an 8 GiB verifier ceiling after adding Euclidean-space/charted-space imports.
5. A source-faithful ProblemContract normalization proposal exists upstream in `vibemathing/vibe-mathing-problem-library-public#3`; it remains a proposal and has not performed canonical admission.

## Current candidate state

Target-repository candidate branch: `web/attempt-poincare-bootstrap`

Committed research artifacts:

- `research/artifacts/source-notes/2026-09-17-poincare-statement-and-mathlib-boundary.md`
- `research/artifacts/candidates/lean/PoincareCorePrerequisites.lean`
- `research/artifacts/candidates/lean/PoincareCorePrerequisites.verification.md`

## Decisive open problems

### Formal target layer

Find a low-import-footprint formulation of

```lean
[T2Space M]
[ChartedSpace (EuclideanSpace ℝ (Fin 3)) M]
[SimplyConnectedSpace M]
[CompactSpace M]
⊢ Nonempty (M ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
```

that compiles within the available verifier resource envelope, without importing or depending on Mathlib's Poincaré `proof_wanted` declaration.

### Mathematical proof body

No formal Ricci-flow / surgery / extinction / geometrization-to-Poincaré proof chain has been established. Existing Mathlib target declarations are statements only. The complete proof remains the dominant mathematical blocker.

### Topological/smooth bridge

A smooth-only theorem cannot close the mission. If the implementation route uses smooth Ricci flow, the topological three-manifold to smooth-manifold bridge must be formalized as a proved dependency and audited; it may not be assumed as a new axiom.

### Admission transport

The concrete target repository's current canonical ProblemContract on `main` remains `draft / preview_unadmitted`. The upstream public problem-library proposal is blocked from green CI by snapshot inventory/tree-digest drift; proposer authority does not include rewriting the publication snapshot or canonical ledger. Trusted admission/rebuild remains pending.

## Failed/limited routes retained

- Full target probe with `PiL2 + ChartedSpace + SimplyConnected` in the existing 8 GiB verifier: resource failure (signal 6), not a proved type failure.
- Treating Mathlib's `proof_wanted` as a theorem: rejected by trust boundary.
- Smooth Poincaré statement as final target: rejected by statement-faithfulness boundary.
- Guessing internal SourceObservation IDs: corrected; direct Clay sources now use `source_record_id: null` in the proposal pending trusted importer resolution.

## Exact continuation point

1. Minimize the target-layer import graph, testing one added import/declaration at a time in the isolated Lean verification PR.
2. Commit every passing or decisively failing probe back to this target branch as a candidate/verification note.
3. Independently survey Mathlib and formal-topology libraries for 3-manifold smoothing/triangulation, connected sums, sphere recognition, Ricci flow, surgery, and geometrization prerequisites; record exact missing infrastructure instead of assuming it.
4. Keep `ROOT_STATUS=OPEN` until all final assurance conditions are met.
