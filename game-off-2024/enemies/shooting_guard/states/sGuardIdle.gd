extends state_machine
class_name sGuardIdle

@export var enem:CharacterBody2D
@export var player_scanner:RayCast2D

var entered:bool = false

func update(_delta:float):
	if enem.player:
		var direction = (enem.player.global_position - player_scanner.global_position).normalized()
		player_scanner.rotation = direction.angle()

	if entered == true and player_scanner.is_colliding():
		if player_scanner.get_collider().is_in_group('player'):
			Transitioned.emit(self,"sGuardMove")

func _on_player_detector_body_entered(body: Node2D) -> void:
	entered = true
	enem.player = body

func _on_player_detector_body_exited(body: Node2D) -> void:
	entered = false
