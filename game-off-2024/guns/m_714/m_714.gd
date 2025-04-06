extends gun_class

func _process(delta: float) -> void:
	var dir = gun.get_global_mouse_position()
	gun.look_at(dir)

	if Input.is_action_pressed("shoot"):
		fire(muzzle.global_rotation)

	if Input.is_action_just_pressed("reload") and reloading == false:
		reload()
	gun.position = get_parent().get_parent().position
