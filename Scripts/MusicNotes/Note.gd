extends Node2D
class_name Note

@onready var area: Area2D = $Area
var element: Elements.Type
var element_time: float = 3.5
var target: Dog
@export var speed: int = 100
@export var spin_speed: float = 15.0
@export var damage: int = 2

func set_target(_target: Dog) -> void:
	target = _target

func _ready():
	area.connect("body_entered", _on_area_entered)

func _physics_process(delta):
	if not is_instance_valid(target):
		queue_free()
		return

	var direction = (target.global_position - global_position).normalized()
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
