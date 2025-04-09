extends enemyMove
class_name sGuardMove

@export var attack_range:int

@export var weapon_manager:Node2D
@export var player_scanner:RayCast2D

func update(_delta:float):
	if enemy_parent.player:
		_move_to_taget(_delta,enemy_parent.player)


	if enemy_parent.global_position.distance_to(enemy_parent.player.global_position) < attack_range:
		Transitioned.emit(self,'sGuardShoot')


func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")
