extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level 1.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://level_13.tscn")
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://level_14.tscn")
	pass # Replace with function body.
