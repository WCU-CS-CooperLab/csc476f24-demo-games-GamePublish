extends RigidBody2D

var username

var accelerate = Vector2.ZERO
var rotation_dir = 0
var engine_power = 400

var handbreak = false
var is_on_road = false
var can_drift = true
var is_drifting = false

var drift_score = 0
var angle_degrees = 0

signal drift_score_change

@export var spin_power = 8000

func _on_tree_entered():
	set_multiplayer_authority(name.to_int())

func _ready():
	pass

func display_username():
	var data = SaveManager.data

func _process(delta):
	if is_multiplayer_authority():
		$Camera2D.make_current()
	get_input()
	
	var angle_radians = rotation
	angle_degrees = angle_radians * 180 / PI
	
	if (linear_velocity.x > 50 or linear_velocity.x < -50) or \
	(linear_velocity.y > 50 or linear_velocity.y < -50):
		if can_drift:
			is_drifting = true 
			
	else:
		is_drifting = false
		if $DriftScoreTimer.is_stopped():
			$DriftScoreTimer.start()
		
	if is_drifting:
		drift_score += 1
		drift_score_change.emit(drift_score)

@rpc("any_peer", "call_local")
func setup_multiplayer(player_id):
	set_multiplayer_authority(player_id)
	var is_player = player_id == get_multiplayer_authority()
	set_physics_process(is_player)
	set_process_unhandled_input(is_player)

func get_input():
	
	accelerate = Vector2.ZERO
	if Input.is_action_pressed("forward") and not handbreak:
		accelerate = transform.y * -engine_power
	if Input.is_action_pressed("backward") and not handbreak:
		if !accelerate.y == 0 and !accelerate.x == 0:
			accelerate.y += 25
		else:
			accelerate = transform.y * engine_power
	
	if Input.is_action_pressed("handbreak"):
		handbreak = true
		
		if spin_power > 0:
			spin_power -= 100
	else:
		handbreak = false
		spin_power = 8000
	
	if not linear_velocity == Vector2.ZERO:
		rotation_dir = Input.get_axis("left", "right")

func _physics_process(delta):
	constant_force = accelerate
	constant_torque = rotation_dir * spin_power

func _on_area_2d_area_entered(area):
	can_drift = false
	is_drifting = false
	drift_score = 0
	drift_score_change.emit(drift_score)

func _on_drift_score_timer_timeout():
	if not is_drifting:
		drift_score = 0
		drift_score_change.emit(drift_score)

func _on_area_2d_area_exited(area):
	can_drift = true
