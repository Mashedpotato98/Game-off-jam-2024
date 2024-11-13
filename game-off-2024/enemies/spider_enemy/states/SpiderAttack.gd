extends state_machine
class_name SpiderAttack

@export var enem_parent:CharacterBody2D
@export var ray:RayCast2D

var player:CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func physics_update(_delta:float):
	ray.look_at(player.global_position)
	if ray.is_colliding():
		ray.extend(Vector2.ZERO,player.position)
		await get_tree().create_timer(0.1).timeout
		Transitioned.emit(self,"spiderMove")
