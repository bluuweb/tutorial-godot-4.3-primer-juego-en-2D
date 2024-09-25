extends RigidBody2D


func _ready() -> void:
	var enemy_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var random_type_number = randi_range(0, enemy_types.size() - 1)
	$AnimatedSprite2D.play(enemy_types[random_type_number])

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
