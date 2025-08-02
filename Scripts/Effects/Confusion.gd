extends Effect

func init(_dog: Dog):
	dog = _dog
	type = Effects.Type.CONFUSION
	time_to_live = 5
	if !check_exists():
		super.init(_dog)


func execute():
	dog.current_index = dog.current_index - 1

func reverse():
	pass
