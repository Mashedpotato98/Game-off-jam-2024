extends Node

var weapon1:Node2D
var weapon2:Node2D

var current_weapon:Node2D

@export var player_walk:state_machine

func _ready():
	var element_count = Global.weapons_bought.size()
	#initialize_weapons(element_count)

func initialize_weapons(element_count):

	for item in Global.weapons_bought:
		var get_element = item["item_location"]

		var load_element = load(get_element)
		var element_to_add = load_element.instantiate()
		add_child(element_to_add)

	weapon1 = get_child(0)
	weapon2 = get_child(1)
	weapon2.set_physics_process(false)
	weapon2.visible = false
	current_weapon = weapon1
