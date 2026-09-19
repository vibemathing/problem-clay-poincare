import Mathlib.AlgebraicTopology.FundamentalGroupoid.VanKampen.IsColimit

open CategoryTheory CategoryTheory.Limits
open TopologicalSpace

set_option backward.isDefEq.respectTransparency false

universe u v

variable {J : Type u} [Category.{v} J]
variable (D : J ⥤ Grpd)

/-- If a colimit apex is thin and the same diagram admits a cocone whose
chosen leg is faithful, then the corresponding diagram object is thin. -/
theorem subsingleton_hom_of_isColimit_faithful_leg
    (c : Cocone D) (hc : IsColimit c)
    (hthin : ∀ x y : c.pt, Subsingleton (x ⟶ y))
    (s : Cocone D) (j : J) [(s.ι.app j).Faithful] :
    ∀ x y : D.obj j, Subsingleton (x ⟶ y) := by
  intro x y
  constructor
  intro f g
  let F := c.ι.app j ⋙ hc.desc s
  have hF : F = s.ι.app j := by
    dsimp [F]
    have hfac := hc.fac s j
    rw [Grpd.comp_eq_comp] at hfac
    exact hfac
  haveI : F.Faithful := by
    rw [hF]
    infer_instance
  have hfg :
      (c.ι.app j).map f = (c.ι.app j).map g :=
    @Subsingleton.elim _ (hthin _ _) _ _
  apply F.map_injective
  exact congrArg (hc.desc s).map hfg

universe u₂

variable {X : Type u₂} [TopologicalSpace X]

/-- Full groupoid Van Kampen plus a faithful test-cocone leg transfers
simple connectivity of the ambient space to a path-connected cover member. -/
theorem simplyConnectedSpace_of_vankampen_faithful_leg
    (X : Type u₂) [TopologicalSpace X]
    (𝒰 : Set (Opens X))
    (hcover : ∀ x : X, ∃ O : Opens X, O ∈ 𝒰 ∧ x ∈ O)
    (hfinite :
      ∀ t : Finset (Opens X), t.Nonempty →
        (∀ O ∈ t, O ∈ 𝒰) →
        t.inf (fun O : Opens X => O) ∈ 𝒰)
    [SimplyConnectedSpace X]
    (U : Opens X) (hU : U ∈ 𝒰)
    [PathConnectedSpace U]
    (s : Cocone
      (((Subtype.mono_coe (fun O : Opens X => O ∈ 𝒰)).functor) ⋙
        Opens.toTopCat (TopCat.of X) ⋙
        FundamentalGroupoid.fundamentalGroupoidFunctor))
    [(s.ι.app ⟨U, hU⟩).Faithful] :
    SimplyConnectedSpace U := by
  let D :=
    (((Subtype.mono_coe (fun O : Opens X => O ∈ 𝒰)).functor) ⋙
      Opens.toTopCat (TopCat.of X) ⋙
      FundamentalGroupoid.fundamentalGroupoidFunctor)
  let c := canonicalCocone X 𝒰
  let hc := my_canonicalCocone_isColimit X 𝒰 hcover hfinite
  have hthinX : ∀ x y : c.pt, Subsingleton (x ⟶ y) := by
    intro x y
    change Subsingleton (Path.Homotopic.Quotient x.as y.as)
    infer_instance
  have hthinU :
      ∀ x y : D.obj ⟨U, hU⟩, Subsingleton (x ⟶ y) :=
    subsingleton_hom_of_isColimit_faithful_leg D c hc hthinX s ⟨U, hU⟩
  rw [simply_connected_iff_paths_homotopic]
  refine ⟨inferInstance, ?_⟩
  intro x y
  change Subsingleton
    ((FundamentalGroupoid.mk x : FundamentalGroupoid U) ⟶
      (FundamentalGroupoid.mk y : FundamentalGroupoid U))
  exact hthinU _ _
