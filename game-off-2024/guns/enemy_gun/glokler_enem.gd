extends gun_class

var player:CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	muzzle.look_at(player.global_position)

	if mag_ammo <= 0:
		reload()

func _on_timer_timeout() -> void:
	fire(muzzle.global_rotation)
