extends RayCast2D

signal looped

func _physics_process(_delta):
	if is_colliding():
		print("colliding")
		var collider = get_collider()
		if collider and collider.get_parent():
			var parent = collider.get_parent()
			if parent.has_method("attack"):
				parent.attack()
