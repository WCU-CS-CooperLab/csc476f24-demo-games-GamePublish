extends Node3D

@export var cam_speed = PI / 2

var zoom = 0.2
var gimabal_movement = 30.0
var gimabal_speed = 0.05

func _process(delta):
	zoom = clamp(zoom, 0.1, 2.0)
	scale = Vector3.ONE * zoom
	self.rotate_y(delta)
	$GimbalInner2.rotate
