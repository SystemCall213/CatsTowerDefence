extends Effect

var slow_multiplier: float = 0
var dog_speed
var original_modulate: Color

func init(_dog: Dog):
	dog = _dog
	dog_speed = dog.speed_orig
	type = Effects.Type.SLOW
	time_to_live = 2

	if !check_exists():
		original_modulate = dog.get_node("Sprite").modulate 
		super.init(_dog)

func execute():
	dog.speed *= slow_multiplier
	dog.get_node("Sprite").modulate = Color(0, 255, 255)

func reverse():
	dog.speed = dog_speed
	dog.get_node("Sprite").modulate = original_modulate
