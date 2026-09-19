# Verification note — faithful-leg Van Kampen bridge

Status: candidate-only exact-pin kernel-checked downstream theorem. This is not an admitted Result and does not prove the Poincare conjecture.

## Environment

- full Van Kampen overlay source: `hanwenzhu/mathlib4@9a19745bf2565abbbf56bb38c91bcd26c4c53b49`
- verifier repository: `vibemathing/vibe-mathing-cn-public`
- verifier branch: `tmp-poincare-vankampen-target-pin-20260917`
- verifier commit: `8967293aeef81fb4f1d8a712e7587d868b3c701b`
- workflow run: `35453120857`
- job: `105923623245`
- Lean: `4.33.0`
- Mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`
- conclusion: success

The same run rebuilt the complete overlaid
`Mathlib.AlgebraicTopology.FundamentalGroupoid.VanKampen.IsColimit`
target successfully: 8737 jobs.

## Checked statements

`subsingleton_hom_of_isColimit_faithful_leg` proves the abstract categorical
step: if a colimit apex has subsingleton hom-sets and another cocone has a
faithful chosen leg, then the corresponding diagram object's hom-sets are
subsingletons.

`simplyConnectedSpace_of_vankampen_faithful_leg` applies that result to the
audited full groupoid Van Kampen colimit.  Under ambient
`SimplyConnectedSpace X`, a path-connected cover member becomes simply
connected as soon as a faithful test-cocone leg for that member is provided.

The theorem does not assume that the cover member is already simply connected.

## Axiom audit

The successful workflow reported:

```text
'subsingleton_hom_of_isColimit_faithful_leg' depends on axioms:
[propext, Classical.choice, Quot.sound]

'simplyConnectedSpace_of_vankampen_faithful_leg' depends on axioms:
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` appeared.  The same run also repeated the standard-axiom audit
for the full Van Kampen declarations.

## Claim boundary

The remaining topology obligation is now concentrated on constructing an
actual faithful test cocone for the three-open family `{U,V,U∩V}`, then
connecting that abstract cover to the connected-sum collar geometry.  The root
Poincare theorem remains open.
