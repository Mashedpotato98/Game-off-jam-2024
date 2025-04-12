extends Node2D

var current_weapon:item_class
var weapon_index:int = 0

@export var weapon_radius:int
@export var max_weapons:int
@export var ui:Node

#region godot functions
func _ready():
	initialize_weapons()

func _process(_delta: float) -> void:
	handle_weapon()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("change_weapon"):
		switch()
#endregion

#region custom functions
func switch():
	get_child(weapon_index).hide()
	get_child(weapon_index).set_process(false)

	increase_weapon_index()

	current_weapon = get_child(weapon_index)
	get_child(weapon_index).show()
	get_child(weapon_index).set_process(false)


	ui.update_ammo_count()

func initialize_weapons():
	for item in Global.weapons_bought:
		add_child(item)
	current_weapon = get_child(0)

	for child in get_child_count():
		get_child(child).hide()
		get_child(child).set_process(false)
	get_child(weapon_index).hide()
	get_child(weapon_index).set_process(true)

#endregion

#region helper functions


func increase_weapon_index():
	if weapon_index == get_child_count() - 1:
		weapon_index = 0
	else:
		weapon_index += 1

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

#endregion
