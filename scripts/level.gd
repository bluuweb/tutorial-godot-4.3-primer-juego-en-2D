extends Node

@export var enemy_scene: PackedScene
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D

var score

func _ready() -> void:
	#new_game()
	$Player.connect("hit", game_over)
	$HUB.connect("start_game", new_game)

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
	#$Player.position = $Marker2D.position
	$Player.start($Marker2D.position)
	score = 0
	$TimerStart.start()
	$HUB.show_message("Get Ready")
	$HUB.update_score(score)
	get_tree().call_group("enemy_group", "queue_free")
	$Music.play()
	
func game_over():
	print('game over')
	$TimerScore.stop()
	$TimerEnemy.stop()
	$HUB.show_game_over()
	$Music.stop()
	$GameOver.play()

func _on_timer_score_timeout() -> void:
	score += 1
	$HUB.update_score(score)

func _on_timer_start_timeout() -> void:
	$TimerEnemy.start()
	$TimerScore.start()
