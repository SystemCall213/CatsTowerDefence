extends Panel

func _ready():
	WaveManager.connect("wave_ended", _on_wave_ended)
	
func _on_wave_ended():
	if WaveManager.current_wave_idx == WaveManager.total_waves:
		self.show()
