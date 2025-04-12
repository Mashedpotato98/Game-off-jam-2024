extends enemyMove
class_name guardMove

func Enter():
	print(enemy_parent.target)

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"guardWander")

func physics_update(_delta:float):
	if enemy_parent.target:
		enemy_parent.velocity.x = spd
		_move_to_taget(_delta,enemy_parent.target)
