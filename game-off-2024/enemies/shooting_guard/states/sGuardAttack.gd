extends enemyMove
class_name sGuardAttack

@export var weapon_manager:Node

func _process(delta: float) -> void:
	weapon_manager.weapon.position = enemy_parent.position

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")
