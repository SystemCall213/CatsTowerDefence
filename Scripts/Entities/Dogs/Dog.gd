extends CharacterBody2D
class_name Dog

@export var waypoint_manager: WaypointManager = null
var waypoints: Array = []
var current_index: int = 0
var speed_orig: float = 50.0
var speed: float = 50.0
var turn_speed: float = 5.0
@export var current_hp: int
@export var max_hp: int = 10
@export var damage:= 1

var effects: Array[Effect] = []
var elements: Array[Element] = []

@onready var hp_bar: HPBar = $ProgressBar

func _ready():
	if waypoint_manager:
		waypoints = waypoint_manager.get_waypoints()
		current_hp = max_hp
		refresh_health()

func set_current_hp(value: int) -> void:
	current_hp = clamp(value, 0, max_hp)
	if current_hp == 0:
		queue_free()
	refresh_health()

func refresh_health():
	hp_bar.set_text("[center]" + str(current_hp) + " / " + str(max_hp))

func _physics_process(delta):
	if waypoints.is_empty():
		return

	var target_pos = waypoints[current_index].global_position
	var direction = (target_pos - global_position).normalized()
	var distance = global_position.distance_to(target_pos)

	if distance > 5.0:
		var target_angle = direction.angle()
		rotation = lerp_angle(rotation, target_angle, turn_speed * delta)
		
		velocity = direction * speed
		move_and_slide()
	else:
		current_index += 1
		if current_index >= waypoints.size():
			queue_free()
func _process(delta):
	for element in elements:
		if element.update(delta):
			print("Element expired: ", element.type)
			elements.erase(element)
func get_damaged(value: int) -> void:
	if value >= current_hp:
		set_current_hp(0)
	else:
		set_current_hp(current_hp - value)
