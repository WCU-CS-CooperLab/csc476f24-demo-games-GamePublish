extends Node

var num_levels = 4
var current_level = 0

var game_scene = "res://Main/main.tscn"
var title_screen_path = "res://ui/title_node.tscn"

func restart():
	current_level = 0
	var title_scene = load(title_screen_path)
	var title_screen = title_scene.instantiate()
	get_tree().change_scene_to_file(title_screen_path)

func next_level():
	current_level += 1
	if current_level == num_levels:
		restart()
	elif current_level <= num_levels:
		get_tree().change_scene_to_file(game_scene)
		
