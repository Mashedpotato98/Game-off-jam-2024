extends enemyAttack
class_name sGuardAttack

@export var weapon_man:Node

func _process(delta: float) -> void:
	weapon_man.weapon.position = enemy_parent.position

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")
