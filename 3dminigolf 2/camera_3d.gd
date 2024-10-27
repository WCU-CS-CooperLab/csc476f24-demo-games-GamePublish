extends Camera3D

# Target FOV values for zoom in and zoom out
var fov_zoom_in = 30.0  # Smaller FOV for zooming in
var fov_zoom_out = 60.0  # Default FOV for zooming out
var max_zoom_out = 90.0
# Speed of the zoom effect
var zoom_speed = 0.5

# Variable to store the target FOV
var target_fov: float = fov_zoom_out

func _ready():
	# Set initial FOV to default (zoomed out)
	self.fov = fov_zoom_out
	

func _process(delta):
	# Smoothly interpolate the current FOV towards the target FOV using lerp
	self.fov = lerp(self.fov, target_fov, zoom_speed)
	
	if Input.is_action_pressed("cam_zoom_in"):
		target_fov -= zoom_speed  # Set target FOV for zoom in
	elif Input.is_action_pressed("cam_zoom_out") and target_fov != max_zoom_out:
		target_fov += zoom_speed # Set target FOV for zoom out
