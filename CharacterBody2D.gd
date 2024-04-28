extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("default")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction>0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walking")
		velocity.x = direction * SPEED
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walking")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
