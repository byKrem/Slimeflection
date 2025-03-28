class_name MirrorPoint
extends Node2D

@export var player: CharacterBody2D

func _ready() -> void:
	var distance = player.global_position - global_position

	$Reflection.global_position = Vector2(
		player.global_position.x,
		global_position.y - distance.y
	)
