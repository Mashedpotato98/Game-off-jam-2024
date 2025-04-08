extends enemyMove
class_name sGuardMove

@export var weapon_manager:Node2D

func _process(delta: float) -> void:
	weapon_manager.curr_weapon.position = enemy_parent.position

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")
