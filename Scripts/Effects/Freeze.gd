extends Effect

var slow_multiplier: float = 0
var dog_speed

func init(_dog: Dog):
	dog = _dog
	dog_speed = dog.speed_orig
	type = Effects.Type.SLOW
	time_to_live = 2
	if !check_exists():
		super.init(_dog)

func execute():
	dog.speed *= slow_multiplier

func reverse():
	dog.speed = dog_speed
