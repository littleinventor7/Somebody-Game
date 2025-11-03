extends CharacterBody2D
var isdamage = 0
var jumpcnt =0
func _physics_process(delta: float) -> void:
	move_and_slide()
	if Input.is_action_pressed("right") and isdamage == 0:
		#Golbal.p_x = sprite.position.x
#		$Particles.emitting = true
		
		velocity.x = 100
	 
	elif Input.is_action_pressed("left") and isdamage == 0 :
		#Golbal.p_x = sprite.position.x
#		$Particles.emitting = true
		velocity.x = -100
		
	else :
		#$Particles.emitting = false
		if is_on_floor() and isdamage == 0:
			#Global.p_y = sprite.position.y
			velocity.x = 0
	if Input.is_action_just_pressed("jump") and jumpcnt<2 :
		jumpcnt+=1
	#	$Particles.emitting = false
		velocity.y = Global.jump_height
		pass
	
	if not is_on_floor() :
		Global.jump_height =-230
#		$Particles.emitting = true
		velocity.y +=8
		pass
	else :
		jumpcnt = 1
		pass
	pass
