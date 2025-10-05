extends Area2D
func _physics_process(delta: float) -> void:
	Global.breaktile = $"."
	Global.breaktile_collision = $StaticBody2D/CollisionShape2D  
