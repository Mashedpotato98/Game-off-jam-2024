extends RayCast2D

@onready var line:Line2D = $Line2d

@export var attack_damage:int

func extend(start_position:Vector2,target_position:Vector2):
	enabled = true
	var start_point = start_position
	line.add_point(start_point)
	var end_point = target_position
	line.add_point(end_point)
	enabled = false

func shrink():
	if line.points.size() > 0:
		line.points.clear()

func _process(delta: float) -> void:
	if is_colliding():
		var collided_with = get_collider()
		if collided_with == HitboxComponent:
			var hitbox:HitboxComponent = collided_with
			var attack = Attack.new()
			attack.attack_damage = attack_damage
			hitbox.damage(attack)
