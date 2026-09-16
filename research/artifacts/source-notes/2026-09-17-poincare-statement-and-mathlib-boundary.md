# Poincaré target statement and Mathlib boundary — 2026-09-17

Status: research source note / non-closure artifact.

## Frozen target

Every closed, simply connected topological 3-manifold is homeomorphic to the standard 3-sphere `S³`.

The target must remain topological and three-dimensional. It must not be replaced by a smooth-only theorem, a finite check, a special case, a homology-sphere statement, a finite-fundamental-group theorem, a conditional geometrization statement, or an imported `proof_wanted`/axiom.

## Source-faithfulness result

At Mathlib revision `db584cd6d46c92f209a44c0f1c829460d327499d`, file

`Mathlib/Geometry/Manifold/PoincareConjecture.lean`

contains the statement-only declaration:

```lean
proof_wanted SimplyConnectedSpace.nonempty_homeomorph_sphere_three
    [T2Space M] [ChartedSpace ℝ³ M] [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₜ 𝕊³)
```

Mathlib labels this declaration “The 3-dimensional topological Poincaré conjecture (proven by Perelman)”. This declaration is useful only for statement identity. It is not proof evidence and must not be imported as a shortcut.

Statement correspondence:

- `T2Space M`: Hausdorff condition.
- `ChartedSpace ℝ³ M`: charts modeled on Euclidean 3-space, giving the boundaryless topological 3-manifold local model.
- `SimplyConnectedSpace M`: simple connectivity.
- `CompactSpace M`: compactness.
- `Nonempty (M ≃ₜ 𝕊³)`: existence of a homeomorphism to the standard 3-sphere.

Mathlib also contains a distinct smooth version with an extra `IsManifold ... ∞ M` hypothesis and a diffeomorphism conclusion. That smooth theorem cannot replace the frozen topological target. Any future topological-to-smooth step must itself be formally proved and audited.

## Direct source locators

- Clay Mathematics Institute, Poincaré Conjecture: https://www.claymath.org/millennium/poincare-conjecture/
- Clay Mathematics Institute, official problem description by John Milnor: https://www.claymath.org/wp-content/uploads/2022/02/MPPc.pdf
- Mathlib pinned statement file: https://github.com/leanprover-community/mathlib4/blob/db584cd6d46c92f209a44c0f1c829460d327499d/Mathlib/Geometry/Manifold/PoincareConjecture.lean

## Current formalization boundary

The target statement layer is expressible using existing Mathlib concepts. The theorem body remains absent. The decisive mathematical work is still the formalization of the three-dimensional Poincaré proof, including whatever topology/geometric-analysis infrastructure is required, with no new unproved mathematical axioms.
