extends Node

@export var spawners: Array[EnemySpawner]

var spawner_info_ui: PackedScene = preload("res://Scenes/WaveInfo/CurrentWaveSpawnerInfo.tscn")

func _ready():
	populate_with_info()
	WaveManager.connect("wave_ended", populate_with_info)

func populate_with_info():
	for child in get_children():
		child.queue_free()
	for spawner in spawners:
		var instance = spawner_info_ui.instantiate() as CurrentWaveSpawnerInfo
		if spawner.waves_scenes.size() > WaveManager.current_wave_idx:
			var dog_scene = spawner.waves_scenes[WaveManager.current_wave_idx]
			var count = spawner.counts[WaveManager.current_wave_idx]
			if dog_scene:
				var dog = dog_scene.instantiate() as Dog
				add_child(instance)
				instance.set_info(dog.get_child(1), dog.max_hp, dog.speed_orig, dog.damage, count)
