extends CharacterBody2D

var speed = 75
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Check input and update direction
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		$AnimatedSprite2D.play("move_up")
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		$AnimatedSprite2D.play("move_down")
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animated_sprite_2d.flip_h = true
		$AnimatedSprite2D.play("move_left")
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1
		animated_sprite_2d.flip_h = false
		$AnimatedSprite2D.play("move_right")
	else:
		$AnimatedSprite2D.play("idle")  # Play idle animation when no input

	if direction != Vector2.ZERO:
		direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
