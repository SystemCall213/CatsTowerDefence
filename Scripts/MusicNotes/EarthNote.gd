extends Note

func _ready():
	super._ready()
	speed = 100
	spin_speed = 5.0
	damage = 7
	element = preload("res://Scenes/Elements/earth_element.tscn")
	homing_strength = speed / 100
