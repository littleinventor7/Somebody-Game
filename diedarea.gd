extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") :
		#body.damage()
		#body.fall()
		get_tree().reload_current_scene()
	pass # Replace with function body.
