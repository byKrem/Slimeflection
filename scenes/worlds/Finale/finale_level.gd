extends Node2D

@export var default_music : AudioStream
@export var corrupted_music : AudioStream
var move_abyss := false
var time := 0


func _ready() -> void:
	$Abyss.hide()
	BgMusic.stop()


func _process(delta: float) -> void:
	if move_abyss:
		var abyss_speed = $Abyss.global_position.distance_to($Player.global_position)/2
		$Abyss.global_position.x += min(max(abyss_speed,60.0),250) * delta
		$Camera2D.limit_left = $Abyss.global_position.x - 250


func _on_abyss_encounter_area_2d_body_exited(body:Node2D) -> void:
	if body:
		$Abyss.show()
		move_abyss = true
		$AbyssEncounterArea2d.queue_free()
		BgMusic.stop()
		BgMusic.stream = corrupted_music
		BgMusic.autoplay = false
		BgMusic.play()


func _on_finish_level_area_2d_body_exited(body:Node2D) -> void:
	if body:
		$Abyss.hide()
		move_abyss = false
		BgMusic.stop()
		$Camera2D.global_position = Vector2(6001.0,1762.0)
		$Player.global_position.x = 6001.0
		$Player.is_in_drop = true
		$CanvasLayer/Results.show()
		$CanvasLayer/Results/Label.text = "Your time:\n" + str(time) + " sec"
		$DontMoveOnFinish.show()


func _on_timer_timeout() -> void:
	time += 1


func _on_tree_exiting() -> void:
	BgMusic.stop()
	BgMusic.stream = default_music
	BgMusic.autoplay = true
	BgMusic.play()
