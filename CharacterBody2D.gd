extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#cloths_init()
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("default")


	if HungerManager.get_cloths() == 'blue':
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
	else:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction>0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("new_style_walking")
			velocity.x = direction * SPEED
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("new_style_walking")
			velocity.x = direction * SPEED
		else:
			$AnimatedSprite2D.play("new_style_default")
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
#func cloths_init():
	#if HungerManager.get_cloths() == 'green':
		#$AnimatedSprite2D.play("new_style_walking")
	#else:
		#$AnimatedSprite2D.play("walking")
