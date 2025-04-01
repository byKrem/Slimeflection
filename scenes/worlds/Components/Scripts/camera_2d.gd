extends Camera2D


@export var target1: CharacterBody2D
@export var target2: CharacterBody2D


func _process(_delta: float) -> void:
	if target1 and target2:
		global_position = (target1.global_position + target2.global_position) / 2
