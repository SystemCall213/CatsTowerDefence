extends HBoxContainer
class_name NotesCombination

var symbol: String
var cat: Cat
var combination: Array[PackedScene] = []
var max_notes_label: PackedScene = preload("res://Scenes/max_notes_label.tscn")


func _ready():
	cat = get_parent()

func add_char(_symbol: String):
	symbol = _symbol

	if combination.size() > 2:
		var instance = max_notes_label.instantiate()
		cat.for_label.add_child(instance)
		return
	
	if CombinationsDictionary.Combinations.has(symbol):
		var note_scene = CombinationsDictionary.Combinations[symbol]
		if note_scene is PackedScene:
			combination.append(note_scene)
			var note_instance = note_scene.instantiate()
			note_instance.init()
			var texture_rect = TextureRect.new()

			var sprite_node = note_instance.sprite
			if sprite_node:
				texture_rect.texture = sprite_node.texture
			else:
				print("Warning: Note instance missing Sprite or texture")

			add_child(texture_rect)

func execute():
	cat.attack_list = combination
	for child in get_children():
		child.queue_free()
