extends Node2D
class_name WaypointManager

@export var waypoints: Array[NodePath]

var waypoint_list: Array[Node2D] = []

func _ready():
	for path in waypoints:
		var wp = get_node(path)
		if wp:
			waypoint_list.append(wp)

func get_waypoints() -> Array[Node2D]:
	return waypoint_list
