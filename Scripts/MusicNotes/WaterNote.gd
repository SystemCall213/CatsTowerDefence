extends Note

func _ready():
	super._ready()
	speed = 100
	spin_speed = 10.0
	damage = 1
	element = Elements.Type.C4_WATER
	homing_strength = speed / 50
