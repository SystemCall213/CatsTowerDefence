extends Node
class_name Element

var type: Elements.Type
var time_to_live: float
var dog: Dog

func init(_dog: Dog):
	dog = _dog
	dog.elements.append(self)
	dog.add_child(self)

func _process(delta):
	time_to_live -= delta
	if time_to_live <= 0:
		queue_free()

func check_exists():
	for element in dog.elements:
		if element.type == type:
			element.time_to_live = time_to_live
			return true
	return false
