extends EnemyFinderStrategy
class_name FindClosestToGoalStrategy

func look_for_enemy():
	return GameManager.get_enemy_closest_to_goal()
