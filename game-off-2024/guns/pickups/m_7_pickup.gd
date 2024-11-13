extends pickup


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.collect_item(item)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
