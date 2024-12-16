extends Node

var json = JSON
var file_path = "res://players.json"

var data = {}
var file
var players = {}

@rpc
func write_save(content):
	file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	data = content
	file.close()

@rpc
func read_save():
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	data = content
	


func print_data():
	print(data)
