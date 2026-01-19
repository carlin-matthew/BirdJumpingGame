extends CharacterBody2D

const GRAVITY: int = 200
const JUMP_VELOCITY := -110
const MAX_FALL_SPEED := 400
const MAX_JUMP_SPEED := -200

var collision: bool = false

func _physics_process(delta):
	# Runs on first collision.
	if get_slide_collision_count() > 0 && !collision:
		# Ensures this block executes only once.
		collision = true
		# Sends player flying somewhat randomly.
		velocity = Vector2(randi_range(0, 200), randi_range(-100, 100))
		# Makes player not collide.
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)
		# Plays crash sound.
		$GameOverSound.play()
		# Calls game over in parent node, if it exists.
		if get_parent().has_method("game_over"):
			get_parent().game_over()
	
	if Input.is_action_just_pressed("jump") && !collision:
		jump()
	else:
		fall(delta)
	# Possible rotation methods.
	#orient()						# Slow rotation.
	#orientdelta(delta)				# Medium rotation.
	rotation_degrees += velocity.y	#Crazy rotation.
	
	move_and_slide()

# Processes physics of jumping.
func jump():
	velocity.y = JUMP_VELOCITY
	$JumpSound.play()

# Processes physics of falling.
func fall(delta):
	velocity.y += GRAVITY * delta
	velocity.y = min(velocity.y, MAX_FALL_SPEED)

func orient():
	if velocity.y > 0:
		rotation_degrees = min(rotation_degrees + 2, 85)
	else:
		rotation_degrees = max(rotation_degrees - 2, -60)

func orientdelta(delta):
	if velocity.y > 0:
		rotation_degrees = min(rotation_degrees + (200 * delta), 85)
	else:
		rotation_degrees = max(rotation_degrees - (400 * delta), -60)
