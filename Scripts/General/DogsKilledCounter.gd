extends RichTextLabel

var dogs_killed = 0

func _ready():
	WaveManager.connect("dog_killed", _on_dog_killed)

func _on_dog_killed():
	dogs_killed += 1
	update_text()

func update_text():
	text = "[center]Dogs put down: " + str(dogs_killed)
