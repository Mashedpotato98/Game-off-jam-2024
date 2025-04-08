extends Node

var weapon_path:String = 'res://items/guns/gun-scenes/'

var curr_weapon:Node2D

var weapon_list:Array =[
	{
		"gun": preload("res://items/guns/gun-scenes/m_714.tscn"),
		"pick_up": preload("res://items/guns/pickups/pickup-scenes/m_7_pickup.tscn")
	},
	{
		"gun": preload("res://items/guns/gun-scenes/rovington_781.tscn"),
		"pick_up": preload("res://items/guns/pickups/pickup-scenes/rovington_pickup.tscn")
	},
	{
		"gun": preload("res://items/guns/gun-scenes/glokler_and_koch.tscn"),
		"pick_up": preload("res://items/guns/pickups/pickup-scenes/glokler_pickup.tscn")
	}
]

func _ready() -> void:
	var random_weapon:Node2D = weapon_list.pick_random()['gun'].instantiate()
	add_child(random_weapon)
	curr_weapon = random_weapon

func _on_health_component_dead() -> void:
	var weapon_pick_up = weapon_list[0]["pick_up"]
	var load_weapon = load(weapon_pick_up)
	load_weapon.instantiate()
	get_tree().root.call_deferred("add_child",load_weapon)

func use_weapon():
	pass
