extends Node

signal wave_ended
var current_wave_idx: int = 0
var enemy_spawners: Array[EnemySpawner]
var wave_in_process = false

func start_wave():
	wave_in_process = true
	for spawner in enemy_spawners:
		spawner.start_wave(current_wave_idx)

func _process(delta):
	if wave_in_process and GameManager.enemies.is_empty():
		wave_in_process = false
		current_wave_idx += 1
		wave_ended.emit()
