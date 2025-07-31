extends HBoxContainer
class_name NotesCombination

var sequence: String
var cat: Cat
var combination: Array[PackedScene] = []

func _ready():
	cat = get_parent()

func add_char(symbol: String):
	sequence += symbol
	if sequence.length() >= 3:
		var last_three = sequence.substr(sequence.length() - 3, 3)
		print("Last 3 chars:", last_three)

		if CombinationsDictionary.Combinations.has(last_three):
			var note_scene = CombinationsDictionary.Combinations[last_three]
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
