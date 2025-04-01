class_name Player
extends CharacterBody2D

var SPEED = 300
var JUMP_SPEED = -450

@export var is_reflection: bool = false
@export var mirroredCopy: CharacterBody2D

var reflect_colide: Vector2 = Vector2(0,0)
var is_in_drop = false
var is_in_jump = false
var was_in_drop = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if is_reflection:
		$AnimatedSprite2D.flip_v = true
		$AnimatedSprite2D.material = load("res://scenes/PlayerData/ReflectedMaterial.tres")
		JUMP_SPEED = -JUMP_SPEED
		gravity = -gravity
		up_direction = Vector2(0,1)

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		is_in_jump = false
		was_in_drop = false

	if is_in_drop and is_on_floor():
		is_in_drop = false
		was_in_drop = true
		velocity.y = JUMP_SPEED * 1.4
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
		if !is_reflection:
			$JumpAudio.play()
		is_in_jump = true
	
	if Input.is_action_just_pressed("drop") and !is_on_floor():
		velocity.y = -JUMP_SPEED * 3
		is_in_drop = true
	
	var direction = Input.get_axis("move_left","move_right")
	
	velocity.x = direction * SPEED
	
	if reflect_colide.x != 0:
		velocity.bounce(reflect_colide)
	
	if is_in_jump:
		$AnimatedSprite2D.play("jump")
	elif is_in_drop:
		$AnimatedSprite2D.play("drop")
	elif !is_in_drop and !is_in_jump and was_in_drop:
		$AnimatedSprite2D.play("bounce")
	elif direction != 0:
		$AnimatedSprite2D.play("moving")
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()
	if mirroredCopy:
		mirroredCopy.global_position.x = (mirroredCopy.global_position.x + global_position.x)/2
		if get_slide_collision_count() == 0:
			mirroredCopy.reflect_colide = Vector2(0,0)
		else:
			for i in get_slide_collision_count():
				var collition = get_slide_collision(i)
				mirroredCopy.reflect_colide = collition.get_normal()
