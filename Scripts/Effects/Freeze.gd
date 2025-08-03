extends Effect

var slow_multiplier: float = 0
var dog_speed

func init(_dog: Dog):
	dog = _dog
	dog_speed = dog.speed_orig
	time_to_live = 2

	if !check_exists():
		super.init(_dog)

func execute():
	dog.speed *= slow_multiplier
	dog.self_modulate = Color8(0,255,255)

func reverse():
	dog.speed = dog_speed
	dog.self_modulate = Color8(255,255,255)
