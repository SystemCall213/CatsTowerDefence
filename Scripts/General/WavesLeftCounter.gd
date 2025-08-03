extends RichTextLabel

func _ready():
	WaveManager.connect("wave_ended", _on_wave_ended)
	WaveManager.count_waves()
	_on_wave_ended()
	
func _on_wave_ended():
	text = "Wave(s) left: " + str((WaveManager.total_waves - WaveManager.current_wave_idx))
