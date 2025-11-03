extends Area2D

func _physics_process(delta: float) -> void:
	await get_tree().create_timer(0.25).timeout
	queue_free()
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.damage()
		pass
	#await get_tree().create_timer(0.25).timeout
	#queue_free()
	pass # Replace with function body.
