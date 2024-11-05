extends enemyAttack
class_name guardAttack

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"guardWander")
