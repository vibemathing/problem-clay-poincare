# Verification note — Van Kampen faithful-leg bridge

Status: candidate code with successful exact-pin kernel verification. This is
not a proof of the Poincare conjecture.

## Environment

- verifier repository: `vibemathing/vibe-mathing-cn-public`
- verifier PR: #13
- verifier commit: `8967293aeef81fb4f1d8a712e7587d868b3c701b`
- exact-pin workflow run: `35453120857`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`
- overlaid Van Kampen source:
  `hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`

The workflow rebuilt the full Van Kampen target:

```text
[8737/8737] Built Mathlib.AlgebraicTopology.FundamentalGroupoid.VanKampen.IsColimit
Build completed successfully (8737 jobs).
```

It then compiled the candidate file containing
`subsingleton_hom_of_isColimit_faithful_leg` and
`simplyConnectedSpace_of_vankampen_faithful_leg`.

## Axiom audit

`#print axioms` reported exactly:

```text
'subsingleton_hom_of_isColimit_faithful_leg' depends on axioms:
  [propext, Classical.choice, Quot.sound]
'simplyConnectedSpace_of_vankampen_faithful_leg' depends on axioms:
  [propext, Classical.choice, Quot.sound]
```

No `sorryAx` appears.

## Mathematical boundary

The first theorem is purely categorical: a thin colimit apex transfers
thinness back to a diagram object if that object has a faithful leg into some
test cocone.

The second theorem applies the audited full groupoid Seifert--van Kampen
colimit to conclude `SimplyConnectedSpace U` for a path-connected cover
member `U`, provided a faithful test-cocone leg at `U` is supplied.

The remaining nontrivial obligation is therefore the construction of such a
faithful cocone for the connected-sum cover (or an equivalent injectivity
theorem for the factor fundamental groupoid). No such assumption is hidden in
these two theorems.
