extends Node2D
@onready var player: CharacterBody2D = $"../Player"

@export var pumbkin_scene: PackedScene
@export var spawn_delay = 3.0
@export var min_x = 50
@export var max_x = 750
@export var spawn_y =  Global.player_y

func _ready():
	randomize()
	$SpawnTimer.wait_time = spawn_delay
	$SpawnTimer.start()
func  _physics_process(delta: float) -> void:
	position.x = player.position.x
	
func _on_spawn_timer_timeout() -> void:
	var pumbkin = pumbkin_scene.instantiate()
	pumbkin.position = Vector2(randf_range(player.position.x - 143 , player.position.x + 143 ), Global.player_y)
	get_parent().add_child(pumbkin)
			  
