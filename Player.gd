extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_velocity : float = -200.0
@export var double_jump_velocity : float = -200.0;

@onready var avatar : AnimatedSprite2D = $Avatar

var has_double_jumped: bool = false
var animation_locked: bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Character direction
var player_facing_right := true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		has_double_jumped = false

		if was_in_air:
			land()
			_on_avatar_animation_finished()
		was_in_air = false;

	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			#normal jump
			jump()
		elif not has_double_jumped:
			#double jump
			double_jump()

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if not animation_locked:
		if not is_on_floor():
			avatar.play("jump_loop")
		else:
			if direction.x != 0:
				avatar.play("run")
			else:
				avatar.play("idle")

func update_facing_direction():
	if direction.x > 0:
		avatar.flip_h = false
	elif direction.x < 0:
		avatar.flip_h = true

func jump():
	velocity.y = jump_velocity
	avatar.play("jump_start")
	animation_locked = true

func double_jump():
	velocity.y = double_jump_velocity
	has_double_jumped = true
	avatar.play("jump_double")

func land():
	avatar.play("jump_end")
	animation_locked = true;


func _on_avatar_animation_finished():
	if(["jump_end", "jump_start", "jump_double"].has(avatar.animation)):
		animation_locked = false
