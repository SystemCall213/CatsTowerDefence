extends Note

func _ready():
	super._ready()
	speed = 400
	spin_speed = 20.0
	damage = 3
	element = Elements.Type.D4_FIRE
	homing_strength = speed / 100
