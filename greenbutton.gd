extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation.play("RESET")

func _on_body_entered(body: Node2D) -> void:
	if not  body.is_in_group("enemy") :
		Global.greebuttonpressed_g = true
		Global.greebuttonnotpressed_g = false
		animation.play("pressed")
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if not  body.is_in_group("enemy") :
		Global.greebuttonpressed_g = false
		Global.greebuttonnotpressed_g = true
		animation.play("non_prseed")
	pass # Replace with function body.
