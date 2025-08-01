extends Node2D

var cat_mode = false
var current_cat: Cat
var current_dog_target: Dog

@onready var note_player1 = $NotePlayer1
@onready var note_player2 = $NotePlayer2
@onready var note_player3 = $NotePlayer3

@onready var enemy_pointer: Sprite2D = $EnemyPointer

var note_players: Array[AudioStreamPlayer2D] = []

# Map key symbols to audio file paths
var note_paths := {
	"A": "res://Assets/Music/Notes/c.mp3",
	"S": "res://Assets/Music/Notes/d.mp3",
	"D": "res://Assets/Music/Notes/e.mp3",
	"F": "res://Assets/Music/Notes/f.mp3",
	"J": "res://Assets/Music/Notes/g.mp3",
	"K": "res://Assets/Music/Notes/a.mp3",
	"L": "res://Assets/Music/Notes/b.mp3"
}

func _ready():
	note_players = [note_player1, note_player2, note_player3]

func _process(_delta):
	if cat_mode:
		for key in note_paths.keys():
			if Input.is_action_just_pressed(key):
				var path = note_paths[key]
				_play_note(path)

				# Add key to cat combination
				current_cat.combination.add_char(key)

		if Input.is_action_just_pressed("SPACE"):
			current_cat.combination.execute()
			cat_mode = false
	else:
		if is_instance_valid(current_dog_target):
			enemy_pointer.show()
			for key in CombinationsDictionary.Combinations.keys():
				if Input.is_action_just_pressed(key):
					var note_scene: PackedScene = CombinationsDictionary.Combinations[key]
					if note_scene:
						var note = note_scene.instantiate() as Note
						var viewport_size = get_viewport().get_visible_rect().size
						note.set_target(current_dog_target)
						note.global_position = viewport_size / 2  # center of screen
						get_tree().current_scene.add_child(note)
		else:
			current_dog_target = null
			enemy_pointer.hide()
	
	var closest_dog: Dog = GameManager.get_enemy_closest_to_goal()
	
	if closest_dog:
		current_dog_target = closest_dog
		enemy_pointer.global_position = closest_dog.global_position

func _play_note(path: String):
	var selected_player: AudioStreamPlayer2D = null

	# Try to find a free player
	for player in note_players:
		if not player.playing:
			selected_player = player
			break

	# If all players are busy, overwrite the first one
	if selected_player == null:
		selected_player = note_players[0]

	selected_player.stop()
	selected_player.stream = load(path)
	selected_player.play()
