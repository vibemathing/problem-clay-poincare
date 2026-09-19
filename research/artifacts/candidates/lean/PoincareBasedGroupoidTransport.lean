import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup
import Mathlib.CategoryTheory.SingleObj

open CategoryTheory

set_option backward.isDefEq.respectTransparency false

noncomputable section

universe u v

variable {C : Type u} [Groupoid.{v} C]

/-- The conjugation map underlying based transport, typed in the source
category before it is used as a morphism of a single-object category. -/
def basedTransportMap (c : C) (p : ∀ x : C, c ⟶ x)
    {x y : C} (f : x ⟶ y) : End c :=
  p x ≫ f ≫ Groupoid.inv (p y)

/-- Transport a connected groupoid to the vertex group at a chosen base object,
using one chosen arrow from the base to every object. -/
def basedTransportFunctor (c : C) (p : ∀ x : C, c ⟶ x) :
    C ⥤ SingleObj (End c) where
  obj _ := SingleObj.star _
  map f := basedTransportMap c p f
  map_id x := by
    change basedTransportMap c p (𝟙 x) = (1 : End c)
    simp [basedTransportMap]
  map_comp f g := by
    change basedTransportMap c p (f ≫ g) =
      basedTransportMap c p g * basedTransportMap c p f
    rw [End.mul_def]
    simp [basedTransportMap, Category.assoc]

/-- Conjugating by chosen base arrows is injective on every hom-set. -/
theorem basedTransportMap_injective
    (c : C) (p : ∀ x : C, c ⟶ x) {x y : C} :
    Function.Injective (basedTransportMap c p : (x ⟶ y) → End c) := by
  intro f g h
  dsimp only [basedTransportMap] at h
  rw [← cancel_epi (p x), ← cancel_mono (Groupoid.inv (p y))]
  simpa only [Category.assoc] using h

instance basedTransportFunctor_faithful
    (c : C) (p : ∀ x : C, c ⟶ x) :
    (basedTransportFunctor c p).Faithful where
  map_injective {_ _} f g h := basedTransportMap_injective c p h


universe u₂

variable {X : Type u₂} [TopologicalSpace X] [PathConnectedSpace X]

/-- In a path-connected space, choose the standard Mathlib path from a
basepoint to each object and obtain a faithful functor from the fundamental
groupoid to the single-object category of the fundamental group. -/
def fundamentalGroupoidBasedTransport (x₀ : X) :
    FundamentalGroupoid X ⥤ SingleObj (FundamentalGroup X x₀) :=
  basedTransportFunctor (FundamentalGroupoid.mk x₀)
    (fun x => Path.Homotopic.Quotient.mk (PathConnectedSpace.somePath x₀ x.as))

instance fundamentalGroupoidBasedTransport_faithful (x₀ : X) :
    (fundamentalGroupoidBasedTransport x₀).Faithful := by
  dsimp [fundamentalGroupoidBasedTransport]
  infer_instance

theorem fundamentalGroupoidBasedTransport_map_injective
    (x₀ : X) {x y : FundamentalGroupoid X} :
    Function.Injective
      (fun f : x ⟶ y => (fundamentalGroupoidBasedTransport x₀).map f) :=
  (fundamentalGroupoidBasedTransport x₀).map_injective
