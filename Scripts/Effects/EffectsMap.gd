extends Node
class_name ElementEffects

static  var slowEffect: PackedScene   = preload("res://Scenes/Effects/slow_effect.tscn")
static var freezeEffect: PackedScene = preload("res://Scenes/Effects/freeze_effect.tscn")
static var burnEffect:PackedScene = preload("res://Scenes/Effects/burn_effect.tscn")

	#C4_WATER,
	#D4_FIRE,
	#E4_EARTH,
	#F4_WIND,
	#G4_CRYO,
	#A4_OIL,
	#B4_LIGHTNING,
	#C5_DARK,
	#D5_LIGHT

static func check_element(target:Dog, element):
	# 1) Zbierz typy elementów na target + własny
	var types := []
	for e in target.elements:
		types.append(e.type)
	types.append(element)
	types.sort()
	var key := ",".join(types.map(str))

	# 2) Wybierz odpowiednią scenę effectu
	var scene: PackedScene
	match key:
		"C4_WATER,E4_EARTH,G4_CRYO":
			scene = freezeEffect
		"A4_OIL,D4_FIRE,E4_EARTH":
			scene = burnEffect
		"D5_LIGHT,E4_EARTH,G4_CRYO":
			scene = null
		_:

			scene = null
	# 3) jeśli mamy efekt, usuń spójne elementy z target.elements
	if scene != null:
		for e in target.elements.duplicate():
			if e != element and types.has(e.type):
				target.elements.erase(e)
				e.queue_free()

	return scene
