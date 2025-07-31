extends Note

@export var slowEffect: PackedScene = preload("res://Scenes/Effects/slow_effect.tscn")
@export var freezeEffect: PackedScene = preload("res://Scenes/Effects/freeze_effect.tscn")

func _ready():
	super._ready()
	speed = 400
	spin_speed = 20.0
	damage = 3
	element = Elements.Type.G_CRYO

func apply_element():
	if check_elements_effects():
		var instance: Effect = freezeEffect.instantiate()
		instance.init(target)
	else:
		var instance: Effect = slowEffect.instantiate()
		instance.init(target)

func check_elements_effects():
	for element in target.elements:
		if element.type == Elements.Type.C_WATER:
			target.elements.erase(element)
			element.queue_free()
			return true
	return false
