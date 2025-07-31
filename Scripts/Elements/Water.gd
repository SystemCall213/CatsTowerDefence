extends Element

func init(_dog: Dog):
	dog = _dog
	type = Elements.Type.C_WATER
	time_to_live = 5
	if !check_exists():
		super.init(_dog)
