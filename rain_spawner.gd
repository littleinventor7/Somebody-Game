extends Node2D
@export var rain_scene: PackedScene
@export var spawn_delay = 2
@onready var heavy_cloud: CharacterBody2D = $".."
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
func _ready():
	randomize()
	$SpawnTimer.wait_time = spawn_delay
	$SpawnTimer.start()
func  _physics_process(delta: float) -> void:
	position.x = sprite_2d.position.x

func _on_spawn_timer_timeout() -> void:
	var rain = rain_scene.instantiate()
	rain.position = Vector2(sprite_2d.position.x, sprite_2d.position.y)
	get_parent().add_child(rain)
			  
