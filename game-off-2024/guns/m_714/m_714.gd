extends gun_class

@onready var anim:AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	gun.look_at(gun.get_global_mouse_position())

	if Input.is_action_pressed("shoot"):
		fire()
	if Input.is_action_just_pressed("reload"):
		reload()
