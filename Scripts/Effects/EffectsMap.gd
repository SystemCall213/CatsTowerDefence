extends Node
class_name ElementEffects

static var slowEffect: PackedScene = preload("res://Scenes/Effects/slow_effect.tscn")
static var freezeEffect: PackedScene = preload("res://Scenes/Effects/freeze_effect.tscn")
static var burnEffect:PackedScene = preload("res://Scenes/Effects/burn_effect.tscn")
static var confusion:PackedScene = preload("res://Scenes/Effects/confusion_effect.tscn")
static var badEffect:PackedScene = preload("res://Scenes/Effects/bad_effect.tscn")
	#C4_WATER,
	#D4_FIRE,
	#E4_EARTH,
	#F4_WIND,
	#G4_CRYO,
	#A4_OIL,
	#B4_LIGHTNING,

static func check_element(target:Dog, element_scene: PackedScene):
	var elem_instance = element_scene.instantiate() as Element
	elem_instance.init(target)
	
	# 1) Zbierz typy elementów na target + własny
	var types := []
	for e in target.elements:
		types.append(Elements.TypeNames[e.type])
	types.sort()
	var key := ",".join(types)

	# 2) Wybierz odpowiednią scenę effectu
	var scene: PackedScene
	match key:
		"C4_WATER,D4_FIRE":
			scene = badEffect
		"E4_EARTH,F4_WIND":
			scene = badEffect
		"C4_WATER,E4_EARTH,G4_CRYO":
			print("mrozon")
			scene = freezeEffect
		"A4_OIL,D4_FIRE,F4_WIND":
			print("fireball!")
			scene = burnEffect
		"D5_LIGHT,E4_EARTH,G4_CRYO":
			scene = null
		"B4_LIGHTNING,C4_WATER,E4_EARTH,G4_CRYO":
			print("its so confusin to be gurl")
			scene = confusion
		_:
			scene = null
	# 3) jeśli mamy efekt, usuń spójne elementy z target.elements
	if scene != null:
		for e in target.elements.duplicate():
			if types.has(Elements.TypeNames[e.type]):
				target.elements.erase(e)
				e.queue_free()
	
	return scene
