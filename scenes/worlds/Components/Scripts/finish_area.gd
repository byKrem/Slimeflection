extends Area2D


var time: int = 0


func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		body.queue_free()
		$"../Camera2D".zoom = Vector2(1,1)
		$"../Camera2D".global_position = self.global_position
		$"../CanvasLayer/Results".visible = true
		$"../CanvasLayer/Results/Label".text = "Your time:\n" + str(time) + " sec"


func _on_timer_timeout() -> void:
	time += 1
