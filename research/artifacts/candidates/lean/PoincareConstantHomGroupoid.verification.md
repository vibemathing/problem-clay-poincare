# Verification note — constant-hom groupoid transport

Status: candidate infrastructure with exact-pin machine verification. This is
not a proof of the Poincare conjecture.

## Receipt

- verifier: `vibemathing/vibe-mathing-cn-public`
- verifier branch: `tmp-poincare-vankampen-target-pin-20260917`
- source commit containing the corrected groupoid laws:
  `2529947b2972108f11214ba9f16727f4899f390a`
- exact-pin run: `35530090468`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

The run compiled `PoincareConstantHomGroupoidProbe.lean` successfully. Its
later failure was in the unrelated optional `PoincareULiftPushoutProbe.lean`,
after this file had already compiled and emitted its axiom audit.

## Audited theorem

```text
'basedTransportToConstantHom_faithful' depends on axioms:
  [propext, Classical.choice, Quot.sound]
```

No `sorryAx` appears.

The construction defines a groupoid with arbitrary object type and a fixed
group as every hom-set, then sends any groupoid to it using based conjugation
followed by a vertex-group homomorphism. If that homomorphism is injective, the
resulting functor is faithful.

This is the target-object device used by the active two-open Van Kampen
pushout-cocone construction.
