extends Area2D

var health: int = 100


func take_damage(amount: int):
	health -= amount
	print("Baza: -", amount, " HP (pozostało ", health, ")")
	ResourceManager.remove_hp(amount)
	if health <= 0:
		game_over()

func game_over():
	pass


func _on_body_entered(body):
	if body is Dog:
		take_damage(body.damage)  # <- Gate traci HP
		body.queue_free()  # Wróg znika po dotarciu
		
