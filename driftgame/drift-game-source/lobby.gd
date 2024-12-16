extends Control

@export_file("*.tscn") var game_sene

@export var blue_car_scene : PackedScene

const ADDRESS = "game.wcpc.fun"
const PORT = 3024

var peer = ENetMultiplayerPeer.new()
var username

func _ready():
	pass

func _on_start_button_pressed():
	rpc_id(get_multiplayer_authority(), "start_game")

@rpc
func send_player(color):
	pass

func _on_blue_car_pressed():
	Global.player_car = Global.car.BLUE
	rpc("send_player", Global.car.BLUE)
func _on_red_car_pressed():
	Global.player_car = Global.car.RED
	rpc("send_player", Global.car.RED)
func _on_yellow_car_pressed():
	Global.player_car = Global.car.YELLOW
	rpc("send_player", Global.car.YELLOW)
func _on_green_car_pressed():
	Global.player_car = Global.car.GREEN
	rpc("send_player", Global.car.GREEN)
