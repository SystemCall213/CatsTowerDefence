extends Element

func init(_dog: Dog):
	dog = _dog
	type = Elements.Type.G4_CRYO
	time_to_live = 4
	if !check_exists():
		super.init(_dog)
