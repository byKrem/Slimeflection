extends CharacterBody2D

const SPEED = 300
const JUMP_SPEED = -400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:

	if !is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= JUMP_SPEED
	
	if Input.is_action_just_pressed("drop") and !is_on_floor():
		velocity.y += JUMP_SPEED * 3
	
	var direction = Input.get_axis("move_right","move_left")
	velocity.x = direction * SPEED

	move_and_slide()