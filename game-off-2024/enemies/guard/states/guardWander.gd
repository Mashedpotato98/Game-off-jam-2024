extends EnemyWander
class_name guardWander

func _on_player_detector_body_entered(body: Node2D) -> void:
	enem_parent.target = body
	Transitioned.emit(self,"guardMove")
