extends Node


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body:
		body.process_mode = Node.PROCESS_MODE_DISABLED