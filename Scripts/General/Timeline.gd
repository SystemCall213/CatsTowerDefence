extends Control

@onready var current_time: TextureRect = $TextureRect
@onready var panel: PanelContainer = $PanelContainer
@export var bpm: int = 480

func _process(delta):
	current_time.position.x += bpm * delta
	if current_time.position.x > panel.size.x - 8:
		current_time.position.x = 0
		CurrentTime.looped.emit()
