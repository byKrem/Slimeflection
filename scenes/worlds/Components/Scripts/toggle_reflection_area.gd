extends Area2D


@export var reflection: CharacterBody2D


func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		reflection.visible = !reflection.visible
		reflection.set_process(reflection.visible)
		reflection.set_physics_process(reflection.visible)
