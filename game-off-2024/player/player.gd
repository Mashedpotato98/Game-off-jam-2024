extends CharacterBody2D

@export var spd:int
@export var accel:int
@export var friction:int

var input_direction = Vector2.ZERO

var hearts_list:Array[TextureRect]

@onready var anim:AnimationPlayer = $AnimationPlayer
@onready var sprite:Sprite2D = $Sprite2D
@onready var weapon_manager:Node = $weapon_manager

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").limit_length()

	velocity = input_direction * spd

	if velocity != Vector2.ZERO:
		anim.play("walk")
	if velocity == Vector2.ZERO:
		anim.play("idle")

	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false

	move_and_slide()

func collect_item(item):
	weapon_manager.add_weapon(item)
