extends Node

signal wave_ended
signal dog_killed

var current_wave_idx: int = 0
var enemy_spawners: Array[EnemySpawner]
var wave_in_process = false
var wave_max_hp_additor: int = 50
var speed_additor: int = 13

var total_waves: int
var total_enemies_in_current_wave: int

func count_waves():
	var max_waves = 0
	for spawner in enemy_spawners:
		if spawner.waves_scenes.size() > max_waves:
			max_waves = spawner.waves_scenes.size()
	
	total_waves = max_waves

func start_wave():
	for spawner in enemy_spawners:
		total_enemies_in_current_wave += spawner.counts[current_wave_idx]
	wave_in_process = true
	for spawner in enemy_spawners:
		spawner.start_wave(current_wave_idx)

func _process(delta):
	if wave_in_process and GameManager.enemies.size() == 0:
		total_enemies_in_current_wave = 0
		GameManager.enemies.clear()
		wave_in_process = false
		current_wave_idx += 1
		ResourceManager.add_gold(45)
		Dog.max_hp += 50
		Dog.speed_orig += 13
		wave_ended.emit()
