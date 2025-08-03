extends Note

func _ready():
	super._ready()
	speed = 100
	spin_speed = 10.0
	damage = 5
	element = preload("res://Scenes/Elements/oil_element.tscn")
	homing_strength = speed / 50
