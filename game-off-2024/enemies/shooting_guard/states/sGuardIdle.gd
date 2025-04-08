extends state_machine
class_name sGuardIdle

var entered:bool = false

func _on_player_detector_body_entered(body: Node2D) -> void:
	entered = true
	Transitioned.emit(self,"sGuardMove")
