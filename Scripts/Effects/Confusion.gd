extends Effect

func init(_dog: Dog):
	dog = _dog
	type = Effects.Type.CONFUSION
	time_to_live = 6
	if !check_exists():
		super.init(_dog)


func execute():
	print(dog.current_index)
	if dog.current_index >= 0:
		dog.current_index = dog.current_index - 1

func reverse():
	pass
