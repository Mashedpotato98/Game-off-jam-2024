extends Node

var weapon:Node2D
var weapon_list:Array = ["res://guns/enemy_gun/m_7_enem.tscn"]

func _ready() -> void:
	var random_weapon = weapon_list.pick_random()
	var load_weapon = load(random_weapon)
	var weapon_to_add = load_weapon.instantiate()
	add_child(weapon_to_add)
	weapon = weapon_to_add
