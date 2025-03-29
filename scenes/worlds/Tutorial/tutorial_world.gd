extends Node2D

var time: int = 0


func _ready():
	$Results.visible = false


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body is Player:
		(body as Player).process_mode = Node.PROCESS_MODE_DISABLED


func _on_restart_area_body_entered(body:Node2D) -> void:
	if body:
		get_tree().reload_current_scene()


func _on_enable_reflection_area_2_body_entered(body:Node2D) -> void:
	if body is Player:
		(body as Player).mirroredCopy.process_mode = Node.PROCESS_MODE_INHERIT


func _on_finish_area_body_entered(body:Node2D) -> void:
	if body is Player:
		body.queue_free()
		$Camera2D.zoom = Vector2(1,1)
		$Results.visible = true
		$"Results/Label".text = "Your time:\n" + str(time) + " sec"


func _on_timer_timeout() -> void:
	time += 1