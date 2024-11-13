extends Node

var weapon:Node2D
var weapon_list:Array = [{"gun":"res://guns/enemy_gun/m_7_enem.tscn","pick_up":""},"res://guns/enemy_gun/rovington_enem.tscn",
"res://guns/enemy_gun/glokler_enem.tscn"]

func _ready() -> void:
	var random_weapon = weapon_list.pick_random()
	var load_weapon = load(random_weapon)
	var weapon_to_add = load_weapon.instantiate()
	add_child(weapon_to_add)
	weapon = weapon_to_add

func _on_health_component_dead() -> void:
	var weapon_pick_up = weapon
	var load_weapon = load(weapon_pick_up)
	load_weapon.instantiate()
	get_tree().root.call_deferred("add_child",load_weapon)
