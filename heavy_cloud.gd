extends CharacterBody2D

var d = -1
var speed = 70
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var y:int
func _physics_process(delta):
	#animation.play("move") 
	position.y = y
	velocity.y =0 
	if is_on_wall() or not  $RayCast2D.is_colliding() :
		d*=-1
	velocity.x = speed * d	
	move_and_slide()
