extends CharacterBody2D

var player:CharacterBody2D

func in_range(range:int):
	if global_position.distance_to(player.global_position) > range:
		return true
	else:
		return false
