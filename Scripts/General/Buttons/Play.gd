extends TextureButton

@export var target_scene_path: String = "res://Scenes/Levels/Level1.tscn"

func _on_pressed():
	get_tree().change_scene_to_file(target_scene_path)
