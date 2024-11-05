extends Area2D

var levels:Array = []

func change_floor():
	levels.shuffle()
	var next_level = levels[1]
	if next_level == get_parent().get_path():
		next_level = levels[2]
	get_tree().change_scene_to_file(next_level)
