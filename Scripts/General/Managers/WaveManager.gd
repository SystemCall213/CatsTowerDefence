extends Node

signal wave_ended
signal dog_killed

var current_wave_idx: int = 0
var enemy_spawners: Array[EnemySpawner]
var wave_in_process = false
var wave_max_hp_additor: int = 30

var total_waves: int

func count_waves():
	var max_waves = 0
	for spawner in enemy_spawners:
		if spawner.waves_scenes.size() > max_waves:
			max_waves = spawner.waves_scenes.size()
	
	total_waves = max_waves

func start_wave():
	wave_in_process = true
	for spawner in enemy_spawners:
		spawner.start_wave(current_wave_idx)

func _process(delta):
	if wave_in_process and GameManager.enemies.is_empty():
		wave_in_process = false
		current_wave_idx += 1
		wave_ended.emit()
