extends state_machine
class_name sGuardIdle

@export var enem:CharacterBody2D
@export var player_scanner:RayCast2D

var player:CharacterBody2D

var entered:bool = false

func _process(delta: float) -> void:
	if player:
		var direction = (player.global_position - player_scanner.global_position).normalized()
		player_scanner.rotation = direction.angle()

	if entered == true and player_scanner.is_colliding():
		Transitioned.emit(self,"sGuardMove")

func _on_player_detector_body_entered(body: Node2D) -> void:
	entered = true
	player = body

func _on_player_detector_body_exited(body: Node2D) -> void:
	entered = false
