extends Note

func _ready():
	super._ready()
	speed = 100
	spin_speed = 30.0
	damage = 1
	element = Elements.Type.B4_LIGHTNING
	homing_strength = speed / 50
