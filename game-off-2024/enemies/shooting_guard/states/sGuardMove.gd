extends enemyMove
class_name sGuardMove

@export var weapon_manager:Node2D
@export var player_scanner:RayCast2D

func _process(delta: float) -> void:
	if player_scanner.is_colliding():
		if player_scanner.get_collider().is_in_group('player'):
			Transitioned.emit(self,'sGuardShoot')

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")
