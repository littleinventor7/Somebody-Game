extends CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()
	if not is_on_floor():
		velocity.y += 8
func _on_blockright_body_entered(body: Node2D) -> void:
	move_and_slide()
	if body.is_in_group("player"):
		velocity.x += 30
	pass # Replace with function body.


func _on_blockleft_body_entered(body: Node2D) -> void:
	move_and_slide()
	if body.is_in_group("player"):
		velocity.x -=  30  
	pass # Replace with function body.


func _on_blockright_body_exited(body: Node2D) -> void:
	await get_tree().create_timer(0.55).timeout
	move_and_slide()
	if body.is_in_group("player"):
		velocity.x = 0
	pass # Replace with function body.


func _on_blockleft_body_exited(body: Node2D) -> void:
	await get_tree().create_timer(0.55).timeout
	if body.is_in_group("player"):
		move_and_slide()
		velocity.x = 0
	pass # Replace with function body.
