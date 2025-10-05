extends CharacterBody2D
var jumpcnt=1
var health = 3
var isdamage = 0
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var jumpsound: AudioStreamPlayer2D = $jumpsound
@onready var fallingsound: AudioStreamPlayer = $fallingsound
@onready var labelcoin: Label = $"UI/score/score label/score numer label"
@onready var healthsprite: Sprite2D = $UI/health/healthsprite
@onready var dieing: CanvasLayer = $UI/dieing
@onready var backgrond: Panel = $UI/Dieing/backgrond
@onready var label: Label = $UI/Dieing/Label
@onready var button: Button = $UI/Dieing/Button
@onready var button_2: Button = $UI/Dieing/Button2
@onready var damage_sound: AudioStreamPlayer2D = $damage_sound
@onready var win: CanvasLayer = $UI/win
var yellow_key = false


func _physics_process(delta):
	if Global.level == 7:
		winn()
	labelcoin.text = str(Global.coins)
	move()
	move_and_slide()
	
	
	
	pass
func move(): 
	if Input.is_action_pressed("right") and isdamage == 0:
		#Golbal.p_x = sprite.position.x
#		$Particles.emitting = true
		sprite.flip_h = false
		velocity.x = 100
		if is_on_floor():
			animation.play("move")
		pass    
	elif Input.is_action_pressed("left") and isdamage == 0 :
		#Golbal.p_x = sprite.position.x
		sprite.flip_h = true
#		$Particles.emitting = true
		velocity.x = -100
		if is_on_floor():
			animation.play("move")
		pass
	else :
		#$Particles.emitting = false
		if is_on_floor() and isdamage == 0:
			#Global.p_y = sprite.position.y
			animation.play("stand")
			velocity.x = 0
	if Input.is_action_just_pressed("jump") and jumpcnt<2 :
		jumpsound.play()
		jumpcnt+=1
	#	$Particles.emitting = false
		velocity.y = Global.jump_height
		animation.play("jump")
		pass
	
	if not is_on_floor() :
		Global.jump_height =-230
#		$Particles.emitting = true
		velocity.y +=8
		animation.play("stand")
		pass
	else :
		jumpcnt = 1
		pass
func die():
	dieing.visible = true
	get_tree().paused = true
func winn():
	win.visible = true
	get_tree().paused = true
func damage():
	
	isdamage = 1
	var dir
	damage_sound.play()
	sprite.modulate = Color.RED
	velocity.y -= 200
	if sprite.flip_h == true :
		dir = -1
		pass
	else :
		dir = 1
	
	velocity.x = -100 * dir
	await get_tree().create_timer(0.25).timeout
	sprite.modulate = Color.WHITE
	
	health -= 1
	match health:
		3:
			healthsprite.frame = 0
		2:
			healthsprite.frame = 1
		1:
			healthsprite.frame = 2
		0:
			healthsprite.frame = 3
			die()
	if health == 0 :
		pass
	isdamage =0
	pass


	
@onready var player: CharacterBody2D = $"."
func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Sceces/control.tscn")
	dieing.visible = false
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
	pass # Replace with function body.
func fall():
	pass


func _on_button_3_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Sceces/control.tscn")
	win.visible = false
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
	pass # Replace with function body.
