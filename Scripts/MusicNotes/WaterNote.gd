extends Note

@export var waterElement: PackedScene = preload("res://Scenes/Elements/water_element.tscn")
@export var freezeEffect: PackedScene = preload("res://Scenes/Effects/freeze_effect.tscn")

func _ready():
	super._ready()
	speed = 100
	spin_speed = 10.0
	damage = 1
	element = Elements.Type.C_WATER
	homing_strength = speed / 50.0

func apply_element():
	if check_elements_effects():
		var instance: Effect = freezeEffect.instantiate()
		instance.init(target)
	else:
		var instance: Element = waterElement.instantiate()
		instance.init(target)

func check_elements_effects():
	for effect in target.effects:
		if effect.type == Effects.Type.SLOW:
			target.effects.erase(effect)
			effect.queue_free()
			return true
	return false
