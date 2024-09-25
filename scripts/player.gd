extends Area2D

var speed = 300
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		position += direction * speed * delta
		if direction.x:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = direction.x < 0
		elif direction.y:
			$AnimatedSprite2D.play("up")
			$AnimatedSprite2D.flip_v = direction.y > 0
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_entered(area: Area2D) -> void:
	print('choqué con un enemigo')
	#area.queue_free()
