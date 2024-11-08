extends Area2D
class_name Hurtbox

@export var attack_damage:int

func hurt(area:HitboxComponent):
	if area.is_in_group("player"):
		#get_tree().change_scene_to_file("res://levels/ui_scenes/game_end.tscn")
		pass
	if area is HitboxComponent:
		var hitbox: HitboxComponent = area

		var attack = Attack.new()
		attack.attack_damage = attack_damage
		hitbox.damage(attack)
