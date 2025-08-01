extends CharacterBody2D
class_name Dog

@export var waypoint_manager: WaypointManager = null
@export var current_hp: int
@export var max_hp: int = 10
@export var damage:= 1

var waypoints: Array = []
var current_index: int = 0
var speed_orig: float = 50.0
var speed: float = 50.0
var turn_speed: float = 5.0

var effects: Array[Effect] = []
var elements: Array[Element] = []

@onready var hp_bar: HPBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite

func _ready():
	if waypoint_manager:
		waypoints = waypoint_manager.get_waypoints()
		current_hp = max_hp
		refresh_health()
	GameManager.enemies.append(self)

func set_current_hp(value: int) -> void:
	current_hp = clamp(value, 0, max_hp)
	if current_hp == 0:
		die()
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
			die()

func die():
	GameManager.enemies.erase(self)
	queue_free()
