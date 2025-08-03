extends RichTextLabel

@export var move_distance := 30.0
@export var duration := 1.0

func _ready():
	modulate.a = 1.0  # Fully visible

	var tween := create_tween()
	tween.tween_property(self, "position:y", position.y - move_distance, duration)
	tween.parallel().tween_property(self, "modulate:a", 0.0, duration)
	tween.tween_callback(Callable(self, "queue_free"))
