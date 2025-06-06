extends Node2D

@export var weapon_radius:int

var weapon_path:String = 'res://items/guns/gun-scenes/'

var current_weapon:item_class

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
	var random_weapon:item_class = weapon_list.pick_random()['gun'].instantiate()
	add_child(random_weapon)
	current_weapon = random_weapon

	if current_weapon is gun_class:
		current_weapon.mag_ammo = 1000
		current_weapon.total_ammo = 1000

func _on_health_component_dead() -> void:
	var weapon_pick_up = weapon_list[0]["pick_up"]
	var load_weapon = load(weapon_pick_up)
	load_weapon.instantiate()
	get_tree().root.call_deferred("add_child",load_weapon)

func use_weapon():
	current_weapon.use()

func handle_weapon(target:CharacterBody2D):
	var pos = get_parent().global_position + (target.global_position - get_parent().global_position).limit_length(weapon_radius)

	current_weapon.global_position = pos
	current_weapon.look_at(target.global_position)
	current_weapon.level_item(get_parent().global_position)

	current_weapon.look_at(target.global_position)
