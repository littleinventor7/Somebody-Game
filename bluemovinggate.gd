extends CharacterBody2D
@export var number = 1
@export var y:float
@export var x:float
var b =0
@onready var col: CollisionShape2D = $CollisionShape2D
func  _ready() -> void:
	position.y = y
	position.x = x
func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity.y = 0
	position.y = y
	print(position.x)
	if Global.greebuttonpressed_b == true :
		b = 1
		velocity.x = 30
 
	if position.x > ((21*number)+x) :
		velocity.x = 0
		Global.greebuttonpressed_b = false
		
	if Global.greebuttonnotpressed_b == true and b==1:
		b=0
		velocity.x = -30
	if position.x < x:
		velocity.x = 0
		position.x = x
		Global.greebuttonnotpressed_b = false

		
	
	
