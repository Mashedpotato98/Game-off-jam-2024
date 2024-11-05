extends state_machine
class_name EnemyWander

@export var enem_parent:CharacterBody2D
@export var wander:Node2D

@export var spd:int
@export var accel:int

func physics_update(_delta:float):
	enem_parent.velocity = Vector2.ZERO

	enem_parent.velocity = enem_parent.velocity.move_toward(wander.direction * spd,accel)
