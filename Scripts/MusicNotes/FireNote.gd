extends Note

func _ready():
	super._ready()
	speed = 400
	spin_speed = 20.0
	damage = 2
	element = preload("res://Scenes/Elements/fire_element.tscn")
	homing_strength = speed / 100
