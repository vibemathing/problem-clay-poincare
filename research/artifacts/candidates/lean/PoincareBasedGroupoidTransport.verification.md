# Verification note — based groupoid transport

Status: candidate-only exact-pin kernel-checked categorical support. This is not an admitted Result and does not prove the Poincare conjecture.

## Environment

- verifier repository: `vibemathing/vibe-mathing-cn-public`
- verifier branch: `tmp-poincare-based-transport-target-pin-20260919`
- verifier commit: `b57d5e381d14c7e2bdaf534bb4e947526b9788cb`
- workflow run: `35453211777`
- job: `105923858271`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`
- conclusion: success

## Checked construction

For an arbitrary groupoid `C`, a base object `c`, and chosen arrows
`p x : c ⟶ x`, the candidate defines

```lean
basedTransportMap c p f = p x ≫ f ≫ Groupoid.inv (p y)
```

as an element of `End c`, packages these maps into

```lean
basedTransportFunctor c p : C ⥤ SingleObj (End c)
```

and proves the map is injective on every hom-set.  The resulting functor has a
`Faithful` instance.

This is the categorical ingredient needed to make a cover-member leg faithful
in the planned three-open Van Kampen test cocone.

## Axiom audit

The successful exact-pin run executed

```text
#print axioms basedTransportMap_injective
```

and reported exactly

```text
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` appeared.  The functor laws and faithful instance compiled in the
same no-placeholder source file.

## Claim boundary

This receipt establishes only the generic based-transport functor and its
faithfulness.  It does not yet construct the full test cocone, prove the
connected-sum factor theorem, or prove the root Poincare theorem.
