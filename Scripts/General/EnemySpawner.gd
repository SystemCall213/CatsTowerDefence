extends Node
class_name EnemySpawner

@export var waypoint_manager: WaypointManager
@export var spawn_interval := 2.0
@export var waves_scenes: Array[PackedScene]
@export var counts: Array[int]

func _ready():
	WaveManager.enemy_spawners.append(self)

func start_wave(_idx: int) -> void:
	if (waves_scenes.size() > _idx):
		var dog_scene = waves_scenes[_idx]
		var dog_count = counts[_idx]
		for i in range(dog_count):
			var dog = dog_scene.instantiate()
			dog.waypoint_manager = waypoint_manager
			add_child(dog)
			await get_tree().create_timer(spawn_interval).timeout
