extends Control

const PORT = 3024

var player_count = 0
var players = {}


var peer = ENetMultiplayerPeer.new()
@export_file("*.tscn") var next_screen_scene_path = "res://Levels/level_base.tscn"

func _ready():
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)

@rpc("any_peer", "call_remote")
func start_game():
	rpc("start_game")
	get_tree().change_scene_to_file(next_screen_scene_path)


func _on_peer_connected(peer_id):
	player_count += 1
	print(peer_id)
