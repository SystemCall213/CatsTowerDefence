extends Effect

var damage: float = 2
var dog_speed

func init(_dog: Dog):
	randomize()
	dog = _dog
	dog_speed = dog.speed_orig
	time_to_live = 5

	if !check_exists():
		super.init(_dog)

func execute():
	var r = int(randf() *256)
	var g = int(randf() *256)
	var b = int(randf() *256)
	print(r,g,b)
	dog.sprite.self_modulate = Color8(r, g, b)

	# 2) Losowy wybór: randf() < 0.5 zamiast randi()%2
	if randf() < 0.5:
		dog.heal(1)
	else:
		dog.get_damaged(1)

func reverse():
	dog.sprite.self_modulate = Color8(255, 255, 255)
