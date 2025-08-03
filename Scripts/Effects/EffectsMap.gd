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
static func check_element(target: Dog, element_scene: PackedScene):
	var elem_instance = element_scene.instantiate() as Element
	elem_instance.init(target)

	# 1) Zbierz typy elementów na target + własny
	var types: Array[String] = []
	for e in target.elements:
		types.append(Elements.TypeNames[e.type])
	types.sort()

	# 2) Combinations as match-sets
	var combinations := {
		["C4_WATER", "D4_FIRE"]: badEffect,
		["E4_EARTH", "F4_WIND"]: badEffect,
		["C4_WATER", "E4_EARTH", "G4_CRYO"]: freezeEffect,
		["A4_OIL", "D4_FIRE", "F4_WIND"]: burnEffect,
		["B4_LIGHTNING", "C4_WATER", "E4_EARTH", "G4_CRYO"]: confusion
	}

	# 3) Find matching subset
	var scene: PackedScene = null
	var combination = null
	for key_array in combinations.keys():
		if _is_subset(key_array, types):
			scene = combinations[key_array]
			combination = key_array
			break

	# 4) Remove matched elements
	if scene != null:
		for e in target.elements.duplicate():
			if Elements.TypeNames[e.type] in combination:
				target.elements.erase(e)
				e.queue_free()

	return scene


static func _is_subset(small, big) -> bool:
	for item in small:
		if big:
			if not big.has(item):
				return false
	return true
