extends Node2D
class_name healthComponent

signal health_changed

@export var max_health:int
var health:float

func _ready():
	health = max_health

func damage(attack: Attack):
	if get_parent().is_in_group("player"):
		#get_tree().call_deferred("change_scene_to_file","res://levels/main_menu.tscn")
		#Global.timer = 0
		pass
	health -= attack.attack_damage
	emit_signal("health_changed")
	if health <= 0:
		get_parent().call_deferred("queue_free")
