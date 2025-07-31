extends Node2D
class_name Cat

@onready var aggression_area: Area2D = $AggressionArea

@export var attack_list: Array[PackedScene]
@export var attack_cooldown: float = 3.0  # Seconds between attacks
@export var attack_interval: float = 0.2  # Interval between notes in a burst

var current_target: Dog = null
var detected_dogs: Array[Dog] = []
var can_attack := true

func _ready():
	aggression_area.connect("body_entered", _on_body_entered)
	aggression_area.connect("body_exited", _on_body_exited)

func _process(_delta):
	_update_target()

func _update_target():
	if detected_dogs.is_empty():
		current_target = null
		return

	var closest: Dog = detected_dogs[0]
	var closest_distance := global_position.distance_to(closest.global_position)

	for dog in detected_dogs:
		if not is_instance_valid(dog):
			continue
		var dist = global_position.distance_to(dog.global_position)
		if dist < closest_distance:
			closest = dog
			closest_distance = dist

	current_target = closest

	# Start attacking if we have a target
	if can_attack and is_instance_valid(current_target):
		_start_attack()

func _on_body_entered(body: Node):
	if body is Dog and body not in detected_dogs:
		detected_dogs.append(body)

func _on_body_exited(body: Node):
	if body is Dog and body in detected_dogs:
		detected_dogs.erase(body)
		if current_target == body:
			current_target = null

func _start_attack():
	can_attack = false
	_fire_burst()
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

func _fire_burst():
	# Fire all Notes in attack_list with small delay
	for i in range(attack_list.size()):
		var note_scene = attack_list[i]
		if note_scene is PackedScene:
			await get_tree().create_timer(attack_interval * i).timeout
			_fire_note(note_scene)

func _fire_note(note_scene: PackedScene):
	if not is_instance_valid(current_target):
		return

	var note = note_scene.instantiate() as Note
	note.set_target(current_target)

	note.global_position = global_position

	get_tree().current_scene.add_child(note)
	
func _add_example_attack_list()->void:
	
	pass
