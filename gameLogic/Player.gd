extends KinematicBody2D


const SPEED = 160
	# Left/right movement speed; Multiplier for normalized Vector2
const SNAP = Vector2(0,0.1) 
	# move_and_slide_with_snap() does a check to see if the body should be snapped to the ground
	# It does this by checking if the body would be colliding if it was moved by SNAP once
	# Tl;dr if the Vector between the floor and the player is less than SNAP the player will be moved onto the floor
const GRAVITY = Vector2(0,320)

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Game actions
	if Input.is_action_pressed("ui_cancel"):
		# Quit game when pressing ESC
		get_tree().quit()
	if Input.is_action_just_pressed("game_restart"):
		# Restart game when pressing R
		# Holding R counts as only one press because of is_action_JUST_pressed()
		get_tree().reload_current_scene()
	# Horizontal movement
		# move_and_slide_with_snap(linear_velocity, snap, up_direction)
		# (DELTA IS AUTOMATICALLY USED BY THIS FUNCTION)
		# linear_velocity: Body is moved by this vector per second
		# snap: See SNAP const above
		# up_direction: Vector used to calculate the floor ceiling and wall directions
	if Input.is_action_pressed("move_left"):
		move_and_slide_with_snap(SPEED*Vector2.LEFT, SNAP, Vector2.UP)
	if Input.is_action_pressed("move_right"):
		move_and_slide_with_snap(SPEED*Vector2.RIGHT, SNAP, Vector2.UP)
	# Vertical movement
	if is_on_floor():
		pass
		# Jumping [TODO]
#		if Input.is_action_pressed("move_jump"):
#			pass
	else:
		# Gravity
		move_and_slide_with_snap(GRAVITY, SNAP, Vector2.UP)
