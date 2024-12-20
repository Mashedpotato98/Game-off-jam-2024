extends state_machine
class_name sGuardIdle


func _on_player_detector_body_entered(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardAttack")
