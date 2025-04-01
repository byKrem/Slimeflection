extends Area2D




func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		$"../Camera2D".global_position.y = $"../Camera2D".global_position.y * -2
