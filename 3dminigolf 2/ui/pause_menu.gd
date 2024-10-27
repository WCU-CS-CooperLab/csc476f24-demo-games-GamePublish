extends CanvasLayer

signal resume

func _on_resume_button_pressed():
	resume.emit()
	hide()


func _on_exit_button_pressed():
	get_tree().quit()
