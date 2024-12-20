extends Node

var weapon:Node2D

var weapon_list:Array =[
	{
		"gun": "res://guns/enemy_gun/m_7_enem.tscn",
		"pick_up": "res://guns/pickups/m_7_pickup.tscn"
	},
	{
		"gun": "res://guns/enemy_gun/rovington_enem.tscn",
		"pick_up": "res://guns/pickups/rovington_pickup.tscn"
	},
	{
		"gun": "res://guns/enemy_gun/glokler_enem.tscn",
		"pick_up": "res://guns/pickups/glokler_pickup.tscn"
	}
]

func _ready() -> void:
	weapon_list.shuffle()
	var random_weapon = weapon_list[0]["gun"]
	var load_weapon = load(random_weapon)
	var weapon_to_add = load_weapon.instantiate()
	add_child(weapon_to_add)
	weapon = weapon_to_add
	print(weapon)

func _on_health_component_dead() -> void:
	var weapon_pick_up = weapon_list[0]["pick_up"]
	var load_weapon = load(weapon_pick_up)
	load_weapon.instantiate()
	get_tree().root.call_deferred("add_child",load_weapon)
