extends gun_class
class_name enemy_gun

var player:CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	muzzle.look_at(player.global_position)

func shoot():
	print('1')
	fire(muzzle.global_rotation)
