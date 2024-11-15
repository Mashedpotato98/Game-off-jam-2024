extends Node

var current_weapon:Node2D
var weapon_index:int = 0

@export var ammo_count:Label 

func _ready():
	var element_count = Global.weapons_bought.size()
	#initialize_weapons(element_count)

func _process(delta: float) -> void:
	#ammo_count.text = str(current_weapon.ammo + "/" + current_weapon.max_ammo)
	if weapon_index == get_child_count():
		weapon_index = 0
	current_weapon = get_child(weapon_index)

 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("change_weapon"):
		weapon_index += 1
		switch_weapon()

func initialize_weapons(element_count):
	for item in Global.weapons_bought:
		var get_element = item["item_location"]

		var load_element = load(get_element)
		var element_to_add = load_element.instantiate()
		add_child(element_to_add)

	weapon_check()

func switch_weapon():
	for child in get_child_count():
		get_child(child).hide()
		get_child(child).set_process(false)
	get_child(weapon_index - 1).show()
	get_child(weapon_index-1).set_process(true)

func add_weapon(weapon:Node2D):
	if get_child_count() < 2:
		add_child(weapon)
		weapon.hide()
		weapon.set_process(false)
		weapon_index += 1

func weapon_check():
	for child in get_child_count():
		get_child(child).hide
		get_child(child).set_process(false)
		get_child(weapon_index).show()
		get_child(weapon_index).set_process(true)
