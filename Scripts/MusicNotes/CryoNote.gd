extends Note

func _ready():
	super._ready()
	speed = 400
	spin_speed = 10.0
	damage = 3
	element = preload("res://Scenes/Elements/cryo_element.tscn")
	homing_strength = speed / 100
