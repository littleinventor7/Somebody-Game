extends Area2D
@export var path:String
@export var level:int
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.level = level
		get_tree().change_scene_to_file(path)
	pass # Replace with function body.
