extends Node2D

@export var reflection: CharacterBody2D


func _ready():
	$Player.is_in_drop = true

func _on_enable_reflection_area_2_body_entered(body:Node2D) -> void:
	if body is Player:
		reflection.visible = !reflection.visible
		reflection.set_process(reflection.visible)
		reflection.set_physics_process(reflection.visible)
