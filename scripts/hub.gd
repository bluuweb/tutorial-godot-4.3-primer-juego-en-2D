extends CanvasLayer

signal start_game

func _on_button_start_pressed() -> void:
	$ButtonStart.hide()
	start_game.emit()
	
func update_score(score: int):
	$LabelScore.text = str(score)
	
func show_message(text: String):
	$LabelTitle.text = text
	$LabelTitle.show()
	$TimerStart.start()

func show_game_over():
	show_message("Game over")
	await $TimerStart.timeout
	
	$LabelTitle.text = "Dodge the Creeps!"
	$LabelTitle.show()
	
	await get_tree().create_timer(1.0).timeout
	$ButtonStart.show()
	

func _on_timer_timeout() -> void:
	$LabelTitle.hide()
