extends Effect

var damage: float = 2
var dog_speed

func init(_dog: Dog):
	dog = _dog
	dog_speed = dog.speed_orig
	time_to_live = 4

	if !check_exists():
		super.init(_dog)

func execute():
	make_it_burn()

func reverse():
	dog.self_modulate = Color8(255,255,255)

func make_it_burn():
	var burn_duration := 4.0
	var damage_interval := 1.0
	var flash_duration := 0.1
	var elapsed := 0.0

	while elapsed < burn_duration and is_instance_valid(dog):
		# Damage the dog
		dog.get_damaged(damage)

		# Flash red
		if is_instance_valid(dog):
			var sprite = dog.get_node("Sprite")
			sprite.modulate = Color8(255, 0, 0)  # red
			await get_tree().create_timer(flash_duration).timeout
			if is_instance_valid(dog):
				sprite.modulate = dog.origin_modulate

		await get_tree().create_timer(damage_interval - flash_duration).timeout
		elapsed += damage_interval
