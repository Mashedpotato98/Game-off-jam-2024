extends Node
class_name item_class

@export var item:Node2D
@export var anim:AnimationPlayer
@export var sprite:Sprite2D

func level_item(player_pos:Vector2):
	if item.get_global_mouse_position().x < player_pos.x:
		sprite.flip_v = true
	elif item.get_global_mouse_position().x > player_pos.x:
		sprite.flip_v = false

func use():
	pass
