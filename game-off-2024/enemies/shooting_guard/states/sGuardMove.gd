extends enemyMove
class_name sGuardMove

@export var attack_range:int

@export var weapon_manager:Node2D
@export var player_scanner:RayCast2D

func update(_delta:float):
	if enemy_parent.player:
		var dir:Vector2 = enemy_parent.global_position.direction_to(enemy_parent.player.global_position)
		player_scanner.rotation = dir.angle()

		_move_to_taget(_delta,enemy_parent.player)
		if enemy_parent.in_range(attack_range):
			Transitioned.emit(self,'sGuardShoot')
	enemy_parent.move_and_slide()

func _on_player_detector_body_exited(body: Node2D) -> void:
	Transitioned.emit(self,"sGuardIdle")

func check_distance():
	pass
