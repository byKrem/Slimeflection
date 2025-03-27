class_name MirrorPoint
extends Node2D

# TODO: Add collition
func _process(_delta):
	var distance = $"../Player".global_position - global_position

	$Reflection.global_position = Vector2(
		global_position.x - distance.x,
		global_position.y - distance.y
	)