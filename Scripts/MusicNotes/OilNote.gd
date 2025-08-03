extends Note

func _ready():
	super._ready()
	speed = 100
	spin_speed = 3.0
	damage = 1
	element = Elements.Type.A4_OIL
	homing_strength = speed / 50
