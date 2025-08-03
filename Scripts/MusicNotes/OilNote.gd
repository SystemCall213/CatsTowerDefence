extends Note

func _ready():
	super._ready()
	speed = 300
	spin_speed = 10.0
	damage = 1
	element = preload("res://Scenes/Elements/oil_element.tscn")
	homing_strength = speed / 50
