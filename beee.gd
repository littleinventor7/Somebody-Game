extends CharacterBody2D

var d = -1
var speed = 70
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var y : int 
func _ready() -> void:
	#$Sprite2D.flip_h = true
	animation.play("move")
	position.x = 100
	pass

func _physics_process(delta):
	position.y = y
	velocity.y = 0
	#animation.play("move") 
	# لو مفيش أرض تحت وعدينا فترة السماح -> لف الاتجاه
	if is_on_wall() or (not $RayCast2D.is_colliding() and $RayCast2D2.is_colliding()) or ($RayCast2D.is_colliding() and not $RayCast2D2.is_colliding() ):
		d*=-1
		$Sprite2D.flip_h = d > 0
	if not $RayCast2D.is_colliding():
		y+=1
	
	# حركة أفقية
	velocity.x = speed * d

	# جاذبية

	
	move_and_slide()


func _on_kill_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		velocity.x = 0
		velocity.y = 0
		body.damage()
		pass
	pass # Replace with function body.


func _on_die_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		animation.play("die")
		speed = 0
		velocity.y = 0
	pass # Replace with function body.


func _on_rayleft_body_entered(body: Node2D) -> void:

	pass # Replace with function body.


func _on_rayright_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
