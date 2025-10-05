extends Area2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var staticbody: StaticBody2D = $StaticBody2D
@onready var collision2: CollisionShape2D = $StaticBody2D/CollisionShape2D
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.yellow_key == true :
		animation.play('opened')
		await get_tree().create_timer(0.3).timeout
		collision.disabled = true
		collision2.disabled = true
		staticbody.scale.x = 0
		staticbody.scale.y = 0
		queue_free()
	pass 
