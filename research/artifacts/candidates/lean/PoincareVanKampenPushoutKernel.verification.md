# Verification note — Pushout normal-form kernel for Van Kampen factor injection

Status: candidate code with successful exact-pin kernel verification. This is
infrastructure only; it does not prove the Poincare conjecture.

## Environment

- verifier repository: `vibemathing/vibe-mathing-cn-public`
- verifier PR: #13
- verifier commit: `1c5c5cf68571fbd948aa1de61868f1b2eef24734`
- exact-pin workflow: `Poincare Pushout kernel target-pin`
- workflow run: `35465448440`
- job: `105956821669`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

The job compiled `PoincareVanKampenPushoutKernel.lean` successfully before a
later dependent probe failed only because the freshly created local `.olean`
was not installed into Lean's module search path.

## Verified declarations and axiom audit

The kernel successfully emitted:

```text
'basedTransportMap_injective' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'basedTransportFunctor_faithful' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'pushoutI_of_injective_of_subsingleton' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'subsingleton_factor_of_pushoutI' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'monoidHom_toFunctor_faithful_of_injective' depends on axioms:
  [Quot.sound]
```

No `sorryAx` appears in these declarations.

## Mathematical content

1. Conjugation by chosen base arrows gives an injective transport map on every
   hom-set of a groupoid and hence a faithful functor to the one-object groupoid
   of the chosen vertex group.
2. Mathlib's normal-form theorem
   `Monoid.PushoutI.of_injective` implies that if the amalgamating group is
   subsingleton, each factor group injects into the group pushout.
3. An injective monoid homomorphism induces a faithful functor between the
   corresponding one-object categories.

These are the algebraic ingredients needed to build a faithful test cocone for
a two-open Van Kampen span whose overlap has trivial fundamental group.

## Failure boundary

The workflow's final conclusion was failure only because the next probe used
`import PoincareVanKampenPushoutKernel` while the generated olean had not been
placed in Lake's module search path. That harness defect occurs strictly after
the verified kernel and does not invalidate the declarations above.

The follow-up verifier commit `00b7a8b679efd3a48ac9606cac41bffeeb26c7d2`
installs the olean into `.lake/build/lib/lean` before dependent probes.
