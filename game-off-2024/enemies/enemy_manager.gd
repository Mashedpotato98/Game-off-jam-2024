extends Node

var enemies:Array
var enemy_to_select:CharacterBody2D

var do_it:bool = true

func _ready() -> void:
	enemies = get_children()

	enemy_to_select = enemies.pick_random()


func _process(delta: float) -> void:
	if enemy_to_select not in enemies and do_it == true:
		increase_keys()
		do_it = false

func increase_keys():
	Global.keys = 1
