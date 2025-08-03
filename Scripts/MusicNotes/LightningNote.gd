extends Note

func _ready():
	super._ready()
	speed = 500
	spin_speed = 40.0
	damage = 1
	element = preload("res://Scenes/Elements/lightning_element.tscn")
	homing_strength = speed / 50
