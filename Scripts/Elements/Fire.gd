extends Element

func init(_dog: Dog):
	dog = _dog
	type = Elements.Type.D4_FIRE
	time_to_live = 2
	if !check_exists():
		super.init(_dog)
