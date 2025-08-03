extends Element

func init(_dog: Dog):
	dog = _dog
	time_to_live = 2
	if !check_exists():
		super.init(_dog)
