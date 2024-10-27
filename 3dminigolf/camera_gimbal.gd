extends Node3D

@export var cam_speed = PI / 2
@export var zoom_speed = 0.01

var zoom = 0.2
var tween


func _ready():
	tween = $GimbalInner2/Camera3D.create_tween()
	tween.play()
	
func _input(event):
	
	while event.is_action_pressed("cam_zoom_in"):
		zoom -= zoom_speed
	if event.is_action_pressed("cam_zoom_in"):
		zoom -= zoom_speed
	elif event.is_action_pressed("cam_zoom_out"):
		zoom += zoom_speed


func _process(delta):
	zoom = clamp(zoom, 0.1, 2.0)
	scale = Vector3.ONE * zoom
	var y = Input.get_axis("cam_left", "cam_right")
	rotate_y(y * cam_speed * delta)
	var x = Input.get_axis("cam_up", "cam_down")
	$GimbalInner2.rotate_x(x * cam_speed * delta)
	$GimbalInner2.rotation.x = clamp($GimbalInner2.rotation.x,
		-PI / 2, -0.2)
