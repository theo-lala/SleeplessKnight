extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Character direction
var player_facing_right := true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Avatar.play("idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Avatar.play("jump")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if direction > 0:
			player_facing_right = true
		else:
			player_facing_right = false
	else:
		velocity.x = 0

	if is_on_floor():
		if velocity.x == 0:
			$Avatar.play("idle")
		else:
			$Avatar.play("run")

	if player_facing_right:
		$Avatar.scale.x = 1
	else:
		$Avatar.scale.x = -1

	move_and_slide()
