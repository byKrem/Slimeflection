extends Camera2D


@export var target1: CharacterBody2D
@export var target2: CharacterBody2D


func _process(_delta: float) -> void:
	if target1:
		global_position.x = target1.global_position.x
	elif target2:
		global_position.x = target2.global_position.x
