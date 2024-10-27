extends Node3D

@export var cam_speed = PI / 2

var zoom = 0.2

func _process(delta):
	
	zoom = clamp(zoom, 0.1, 2.0)
	scale = Vector3.ONE * zoom
	var y = Input.get_axis("cam_left", "cam_right")
	rotate_y(y * cam_speed * delta)
	var x = Input.get_axis("cam_up", "cam_down")
	$GimbalInner2.rotate_x(x * cam_speed * delta)
	$GimbalInner2.rotation.x = clamp($GimbalInner2.rotation.x,
		-PI / 2, -0.2)
