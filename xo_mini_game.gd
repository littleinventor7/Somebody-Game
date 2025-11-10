extends Node

var player : int
var winner : int
var grid_data : Array
var temp_marker : Node
var player_panle_pos : Vector2i
var grid_pos:Vector2i
var board_postion:Vector2
var cell_size:int
var row_sum: int
var col_sum: int
var diagonal1_sum: int
var diagonal2_sum: int
@export var circle_scene : PackedScene
@export var cross_scene : PackedScene
func _ready() -> void:
	new_game()
	pass

func _process(delta: float) -> void:
	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT:
			if event.position.x >= 347 and event.position.y >= 84 and  event.position.x <= 804 and event.position.y <= 552:
				event.position -= board_postion
				grid_pos= Vector2i(event.position/ cell_size)
				if grid_data [grid_pos.y][grid_pos.x] == 0:
					grid_data [grid_pos.y][grid_pos.x] = player 
					create_marker(player, grid_pos* cell_size+ Vector2i(412,160))
					if check_win() != 0:  
						get_tree().paused = true
						$CanvasLayer.visible = true
						print("Game over") 
					player *= -1 
					temp_marker.queue_free()
					create_marker(player, player_panle_pos + Vector2i(75,75),true)
					print(grid_data)
					
func new_game():
	$CanvasLayer.visible = false
	player_panle_pos = $PlayerPanel.get_screen_position()
	player =  1
	winner = 0
	board_postion=Vector2(347.0,84.0)
	cell_size = 162
	grid_data = [
		[0,0,0],
		[0,0,0],
		[0,0,0]]
	create_marker(player, player_panle_pos + Vector2i(75,75),true)
	pass
func create_marker(player, postion,temp=false):
	if player == 1:
		var circle = circle_scene.instantiate()
		circle.position = postion
		add_child(circle)
		if temp:
			temp_marker = circle
			
	if player == -1:
		var cross = cross_scene.instantiate()
		cross.position = postion
		add_child(cross)
		if temp:
			temp_marker = cross
func check_win():
	for i in range(len(grid_data)):
		row_sum = grid_data[i][0] + grid_data[i][1] + grid_data[i][2]
		col_sum = grid_data[0][i] + grid_data[1][i] + grid_data[2][i]
		diagonal1_sum= grid_data[0][0] + grid_data[1][1] + grid_data[2][2]
		diagonal2_sum= grid_data[0][2] + grid_data[1][1] + grid_data[2][0]
		if row_sum == 3 or col_sum == 3 or diagonal1_sum == 3 or diagonal2_sum == 3:
			winner = 1
		elif row_sum == -3 or col_sum == -3 or diagonal1_sum == -3 or diagonal2_sum == -3:
			winner = -1
	return winner


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")
	pass # Replace with function body.
