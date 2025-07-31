extends Node

@export var waypoint_manager: WaypointManager
@export var enemies_to_spawn: Dictionary = {}
@export var spawn_interval := 2.0

var spawn_queue: Array = []
var current_index := 0

func _ready():
	for scene: PackedScene in enemies_to_spawn.keys():
		var count = enemies_to_spawn[scene]
		for i in range(count):
			spawn_queue.append(scene)

	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(timer)

func _on_spawn_timer_timeout():
	if current_index >= spawn_queue.size():
		return

	var scene = spawn_queue[current_index]
	var enemy = scene.instantiate()
	enemy.waypoint_manager = waypoint_manager
	add_child(enemy)

	current_index += 1
