extends Effect

var slow_multiplier: float = 0.25

func init(_dog: Dog):
	dog = _dog
	type = Effects.Type.SLOW
	time_to_live = 3.5
	if !check_exists():
		super.init(_dog)

func execute():
	dog.speed *= slow_multiplier

func reverse():
	dog.speed = dog.speed * (1 / slow_multiplier)
