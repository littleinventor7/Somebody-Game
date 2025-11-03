extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
@onready var heavy_cloud: CharacterBody2D = $".."
func _physics_process(delta: float) -> void:
	position.x = sprite_2d.position.x
	
	move_and_slide()
	if is_on_floor():
		queue_free()
	else :
		velocity.y += 2
