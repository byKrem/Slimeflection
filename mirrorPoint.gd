class_name MirrorPoint
extends Node2D

func _ready() -> void:
	var distance = $"../Player".global_position - global_position

	$Reflection.global_position = Vector2(
		$"../Player".global_position.x,
		global_position.y - distance.y
	)
