extends Node2D

var current_weapon:item_class
var weapon_index:int = 0

@export var weapon_radius:int
@export var max_weapons:int
@export var ui:Node

#region godot functions
func _ready():
	var element_count = Global.weapons_bought.size()
	current_weapon = get_child(weapon_index)
	#initialize_weapons(element_count)

func _process(delta: float) -> void:
	handle_weapon()
	
	#if weapon_index == get_child_count():
		#weapon_index = 0
	#current_weapon = get_child(weapon_index)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("change_weapon"):
		#weapon_index += 1
		switch()
#endregion

#region custom functions
func switch():
	get_child(weapon_index).hide()
	get_child(weapon_index).set_process(false)

	increase_weapon_index()

	current_weapon = get_child(weapon_index)
	get_child(weapon_index).show()
	get_child(weapon_index).set_process(true)

	ui.update_ammo_count()

func add_weapon(weapon:Node2D):
	if get_child_count() < max_weapons:
		add_child(weapon)
		weapon.hide()
		weapon.set_process(false)
		weapon_index += 1

func handle_weapon():
	if Input.is_action_pressed("shoot") and current_weapon is gun_class:
		current_weapon.use()
		ui.update_ammo_count()
	if Input.is_action_just_pressed('reload') and current_weapon is gun_class:
		current_weapon.reload()
		ui.update_ammo_count()

	var mos_pos = get_global_mouse_position()
	var pos = get_parent().global_position + (mos_pos - get_parent().global_position).limit_length(weapon_radius)

	current_weapon.global_position = pos
	current_weapon.look_at(mos_pos)
	current_weapon.level_item(get_parent().global_position)

#func initialize_weapons(element_count):
	#for item in Global.weapons_bought:
		#var get_element = item["item_location"]
		#var load_element = load(get_element)
		#var element_to_add = load_element.instantiate()
		#add_child(element_to_add)
	#weapon_check()

#func weapon_check():
	#for child in get_child_count():
		#get_child(child).hide
		#get_child(child).set_process(false)
		#get_child(weapon_index).show()
		#get_child(weapon_index).set_process(true)
#endregion

#region helper functions
func increase_weapon_index():
	if weapon_index == get_child_count() - 1:
		weapon_index = 0
	else:
		weapon_index += 1
#endregion
