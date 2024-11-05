extends state_machine
class_name enemyAttack

@export var enemy_parent:CharacterBody2D
@export var navigation:NavigationAgent2D

@export var spd:int
@export var accel:int

var target:CharacterBody2D

func Enter():
	target = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if target:
		_move_to_taget(delta)
	enemy_parent.move_and_slide()

func _move_to_taget(_delta):
	var direction = Vector2()

	navigation.target_position = target.global_position
	direction = navigation.get_next_path_position() - enemy_parent.global_position
	direction = direction.normalized()

	enemy_parent.velocity = Vector2.ZERO
	enemy_parent.velocity = enemy_parent.velocity.move_toward(direction * spd,accel)
