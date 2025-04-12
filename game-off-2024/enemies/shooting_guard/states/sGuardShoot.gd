extends state_machine
class_name sGuardShoot

@export var enem:CharacterBody2D
@export var weapon_manager:Node2D
@export var player_scanner:RayCast2D

@export var range:int = 80

func physics_update(_delta:float):
	if enem.player:
		var dir:Vector2 = enem.global_position.direction_to(enem.player.global_position)
		player_scanner.rotation = dir.angle()

		if player_scanner.is_colliding():
			if player_scanner.get_collider().is_in_group('player'):
					weapon_manager.use_weapon()
					weapon_manager.handle_weapon(enem.player)

	if enem.in_range(range):
		Transitioned.emit(self,"sGuardMove")

		#if player_scanner.is_colliding() == false:
			#Transitioned.emit(self,"sGuardMove")
