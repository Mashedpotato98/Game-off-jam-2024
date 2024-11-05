extends CharacterBody2D

@export var group_name:String

func _physics_process(delta: float) -> void:
	move_and_slide()
