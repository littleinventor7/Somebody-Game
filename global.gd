extends Node

var coins = 0
var p_x = 0
var p_y =0
var jump_height = -230
var level = 1

@onready var breaktile: Area2D 
@onready var breaktile_collision: CollisionShape2D 
var diamond = 0
func _physics_process(delta: float) -> void:
	print(level)
	match level:
		2:
			if Input.is_action_just_pressed("super_power") and coins >= 10:
				jump_height = -410
				coins -= 10 
		4:
			if Input.is_action_just_pressed("super_power") and coins >= 10:
				breaktile.visible = false
				breaktile_collision.disabled = true 
				coins -= 10 
	
