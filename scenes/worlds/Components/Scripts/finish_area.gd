extends Area2D


var time: int = 0


func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		body.queue_free()
		var tween := create_tween()
		tween.tween_property($"../Camera2D","zoom",Vector2(1,1),0.05)
		tween.parallel().tween_property($"../Camera2D","position",self.global_position,0.1).set_ease(Tween.EASE_IN_OUT)
		$"../CanvasLayer/Results".visible = true
		$"../CanvasLayer/Results/Label".text = "Your time:\n" + str(time) + " sec"


func _on_timer_timeout() -> void:
	time += 1
