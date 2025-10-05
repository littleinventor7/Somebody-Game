extends CharacterBody2D

var d = -1
var speed = -100
@export var ypostion = 215
func _physics_process(delta):
	if position.y > ypostion :
		position.y -=  position.y-ypostion
	#position.y = ypostion
	if is_on_wall() :
		d*=-1
	velocity.x = speed * d

	move_and_slide()
