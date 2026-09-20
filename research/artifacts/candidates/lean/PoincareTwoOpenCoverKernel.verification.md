# Verification note — subordinate two-open cover kernel

Status: candidate infrastructure with exact-pin machine verification.

## Receipt

- verifier: `vibemathing/vibe-mathing-cn-public`
- verifier commit: `35c7d5978e5e0db5477168fc4cfcc24e50dd435b`
- workflow: `Poincare Pushout kernel target-pin`
- exact-pin run: `35530929438`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

The run compiled the subordinate-cover kernel and reported:

```text
'subordinateTwoCover_covers' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'subordinateTwoCover_finiteIntersections' depends on axioms:
  [propext, Classical.choice, Quot.sound]
```

No `sorryAx` appears.

The family consists of all opens `O` satisfying `O ≤ U ∨ O ≤ V`.
If `U ⊔ V = ⊤`, it covers the ambient space, and every nonempty finite
intersection remains subordinate to one side.  This supplies exactly the
intersection-closed open family required by the audited full groupoid
Seifert--van Kampen theorem.
