extends Node

@export var enemy_scene: PackedScene
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D

func _ready() -> void:
	new_game()

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	path_follow_2d.progress_ratio = randf()
	enemy.position = path_follow_2d.position
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	var direction = path_follow_2d.rotation + deg_to_rad(90)
	direction += randf_range(deg_to_rad(-45), deg_to_rad(45))
	enemy.rotation = direction
	enemy.linear_velocity = velocity.rotated(direction)
	
	add_child(enemy)

func new_game():
	$Player.position = $Marker2D.position
