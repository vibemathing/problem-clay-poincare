# Verification note — compatible based-transport extension

Status: candidate infrastructure with exact-pin machine verification.

## Receipt

- verifier: `vibemathing/vibe-mathing-cn-public`
- verifier commit: `b6319ac36488bca6e130e45ab6de46528fa11025`
- workflow: `Poincare Pushout kernel target-pin`
- exact-pin run: `35530751563`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

The run compiled the compatible-base-arrow module and reported exactly:

```text
'extendBaseArrows_obj' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'basedTransportMap_map_extend' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'basedTransportMap_mapEnd_extend' depends on axioms:
  [propext, Classical.choice, Quot.sound]
```

No `sorryAx` appears.

## Content

For a functor with injective object map, `extendBaseArrows` extends a chosen
system of arrows from a base object so that on every source object it agrees
strictly with the mapped source base arrow. The two transport theorems then
show based conjugation commutes strictly with the functor, including the
induced vertex-group homomorphism.

This is used to make the two overlap-to-side composites in the active
two-open pushout cocone definition strictly equal, rather than merely
naturally isomorphic.
