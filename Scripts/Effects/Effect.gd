extends Node2D
class_name Effect

var dog: Dog
var type: Effects.Type
var time_to_live: float

func init(_dog: Dog):
	dog = _dog
	dog.effects.append(self)
	dog.add_child(self)
	execute()

func execute():
	pass

func reverse():
	pass

func _process(delta):
	time_to_live -= delta
	if time_to_live <= 0:
		dog.effects.erase(self)
		reverse()
		queue_free()

func check_exists():
	for effect in dog.effects:
		if effect.type == type:
			effect.time_to_live = time_to_live
			return true
	return false
