extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var path:String
#@export var level:int
func _ready() -> void:
	animation.play('MOVE')



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.coins -= 20
		body.blue_key = true
		get_tree().change_scene_to_file(path)
		animation.play('taken')
	pass # Replace with function body.
