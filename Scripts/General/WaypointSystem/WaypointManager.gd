extends Node2D
class_name WaypointManager

var waypoints: Array[NodePath]
var waypoint_list: Array[Node2D] = []
var total_path_length: float = 0.0

func _ready():
	for waipoint in get_children():
		waypoint_list.append(waipoint)

	# Precompute total path length
	for i in range(waypoint_list.size() - 1):
		total_path_length += waypoint_list[i].global_position.distance_to(
			waypoint_list[i + 1].global_position
		)
		

func get_waypoints() -> Array[Node2D]:
	return waypoint_list

func get_total_path_length() -> float:
	return total_path_length
