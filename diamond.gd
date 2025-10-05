extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.diamond += 1
		#Golbal.coins += 1
		animation.play('taken')
	pass # Replace with function body.
