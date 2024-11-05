extends CharacterBody2D

@export var spd:int
@export var accel:int
@export var friction:int

var input_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").limit_length()

	velocity = input_direction * spd

	move_and_slide()
