extends Node2D
class_name Note

@onready var area: Area2D = $Area
@onready var sprite: Sprite2D = $Sprite
@onready var note_player1 = $Players/NotePlayer1
@onready var note_player2 = $Players/NotePlayer2
@onready var note_player3 = $Players/NotePlayer3

var element: Elements.Type
var element_time: float = 3.5
var target: Dog
var play_interval: float = 0.1
@export var speed: int = 100
@export var spin_speed: float = 15.0
@export var damage: int = 2

var direction
var death_timer_started := false

func init():
	area = $Area
	sprite = $Sprite
	
func set_target(_target: Dog) -> void:
	target = _target

func _ready():
	area.connect("body_entered", _on_area_entered)
	
	var note_players = [note_player1, note_player2, note_player3]
	for player in note_players:
		await get_tree().create_timer(play_interval).timeout
		player.play()

func _physics_process(delta):
	if is_instance_valid(target):
		direction = (target.global_position - global_position).normalized()
	else:
		if not death_timer_started:
			death_timer_started = true
			await get_tree().create_timer(1.0).timeout
			queue_free()

	position += direction * speed * delta
	rotation += spin_speed * delta

func _on_area_entered(dog: Dog) -> void:
	if dog == target:
		dog.set_current_hp(dog.current_hp - damage)
		apply_element()
		_explode()

func _explode():
	$Particles.emitting = true
	$Sprite.visible = false

	await get_tree().create_timer(1.0).timeout
	queue_free()

func apply_element():
	pass

func check_elements_effects():
	pass
