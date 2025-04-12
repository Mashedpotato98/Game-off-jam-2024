extends CharacterBody2D

@export var group_name:String

var target:CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()
