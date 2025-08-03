extends Note

func _ready():
	super._ready()
	speed = 400
	spin_speed = 10.0
	damage = 3
	element = Elements.Type.G4_CRYO
	homing_strength = speed / 100
