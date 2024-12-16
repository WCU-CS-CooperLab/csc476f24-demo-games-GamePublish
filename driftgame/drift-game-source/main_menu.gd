extends Control

@export_file("*.tscn") var game_scene

var can_start = false

var peer = ENetMultiplayerPeer.new()
const ADDRESS = "game.wcpc.fun"
const PORT = 3024

func _ready():
	peer.create_client(ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

func _on_button_pressed():
	rpc_id(get_multiplayer_authority(), "start_game")

@rpc("authority", "call_local")
func start_game():
	get_tree().change_scene_to_file(game_scene)
