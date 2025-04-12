extends CharacterBody2D

var direction = Vector2.RIGHT

@export var spd = 300

func _ready():
	direction = Vector2.RIGHT.rotated(global_rotation)

func _physics_process(delta):
	velocity = direction * spd
	move_and_slide()

func _on_hurtbox_component_area_entered(area: Area2D) -> void:
	print(area.get_parent())
	$hurtboxComponent.hurt(area)

func _on_timer_timeout() -> void:
	call_deferred('queue_free')

func _on_collision_checker_body_entered(body: Node2D) -> void:
	call_deferred('queue_free')
