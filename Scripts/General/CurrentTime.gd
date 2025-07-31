extends TextureRect

signal looped

func _physics_process(_delta):
	var space_state = get_world_2d().direct_space_state

	# Create a tall, thin shape to act like a downward ray
	var shape := RectangleShape2D.new()
	shape.extents = Vector2(2, 1000)  # 2000px tall vertical line

	# Set transform to align shape below current position
	var transform := Transform2D.IDENTITY
	transform.origin = global_position + Vector2(0, shape.extents.y)

	# Set query parameters
	var query := PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform = transform
	query.collide_with_areas = true
	query.collide_with_bodies = true
	query.collision_mask = 1  # adjust this as needed

	# Perform intersection
	var results = space_state.intersect_shape(query, 32)

	for result in results:
		var collider = result.collider
		if collider and collider.get_parent() and collider.get_parent().has_method("attack"):
			collider.get_parent().attack()
