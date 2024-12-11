extends Marker2D

@export var blue_car_scene : PackedScene
@export var red_car_scene : PackedScene
@export var green_car_scene : PackedScene
@export var yellow_car_scene : PackedScene

var player_car

signal player_added

func _ready():
	if is_multiplayer_authority():
		for i in range(0, multiplayer.get_peers().size()):
				var s = blue_car_scene.instantiate()
				var s_id = multiplayer.get_peers()[i]
				s.name = str(s)
				add_child(s)
				await(get_tree().create_timer(0.1).timeout)
				s.rpc("setup_multiplayer", s_id)

func _on_multiplayer_spawner_spawned(node):
	player_added.emit(node)
