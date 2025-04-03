extends Node2D

@export var default_music : AudioStream
@export var corrupted_music : AudioStream
var move_abyss := false


func _ready() -> void:
	$Abyss.hide()
	BgMusic.stop()


func _process(delta: float) -> void:
	if move_abyss:
		var abyss_speed = $Abyss.global_position.distance_to($Player.global_position)/2
		$Abyss.global_position.x += min(max(abyss_speed,100.0),250) * delta
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
