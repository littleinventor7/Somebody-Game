extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var number = 1
@export var x = 0
@export var y = 0
func _physics_process(delta: float) -> void:
	if Global.greebuttonpressed == true :
		anim
		Global.greebuttonpressed = false
	if Global.greebuttonnotpressed == true :
		while position.x>((number*21)+position.x) :
			velocity.x = -10
		Global.greebuttonnotpressed = false
		
