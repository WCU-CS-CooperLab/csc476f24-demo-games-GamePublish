extends Node3D

var background_size = 4
var curr_index = 0

func _ready():
	set_background()

func set_background():
		$Background.get_child(curr_index).visible = true
		

	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		GameState.current_level = -1
		GameState.next_level()


func _on_timer_timeout():
	if curr_index == background_size-1:
		$Background.get_child(curr_index).visible = false
		curr_index = 0
		set_background()
	else:
		$Background.get_child(curr_index).visible = false
		curr_index += 1
		set_background()
