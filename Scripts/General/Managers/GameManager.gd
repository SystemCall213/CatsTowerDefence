extends Node

var enemies: Array[Dog]

func get_enemy_closest_to_goal() -> Dog:
	var best_enemy: Dog = null
	var shortest_remaining_distance: float = INF

	for enemy in enemies:
		if enemy == null:
			continue

		var manager = enemy.waypoint_manager
		if manager == null:
			continue

		var waypoints = manager.get_waypoints()
		if waypoints.size() < 2:
			continue

		var remaining_distance = 0.0
		var i = enemy.current_index

		# From enemy's position to current target waypoint
		if i < waypoints.size():
			remaining_distance += enemy.global_position.distance_to(waypoints[i].global_position)

		# Add distances from current waypoint to end
		for j in range(i, waypoints.size() - 1):
			remaining_distance += waypoints[j].global_position.distance_to(
				waypoints[j + 1].global_position
			)

		if remaining_distance < shortest_remaining_distance:
			shortest_remaining_distance = remaining_distance
			best_enemy = enemy

	return best_enemy
