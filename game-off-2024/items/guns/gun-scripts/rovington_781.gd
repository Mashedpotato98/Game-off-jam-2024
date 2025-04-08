extends gun_class

#func handler():
	#gun.position = get_parent().position
	#var dir = gun.get_global_mouse_position()
	#gun.look_at(dir)

func use():
	fire(muzzle.global_rotation)
	#get_parent().ui.update_ammo_count()
