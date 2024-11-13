extends enemyAttack
class_name spiderMove

@export var ray:RayCast2D

func Enter():
	ray.shrink()

func _on_player_detector_body_entered(body: Node2D) -> void:
	Transitioned.emit(self,"spiderAttack")
