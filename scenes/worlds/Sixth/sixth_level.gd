extends Node2D

@export var noice_start : AudioStream
@export var noice : AudioStream
@export var default_music : AudioStream
@export var corrupted_music : AudioStream


func _ready() -> void:
	BgMusic.stop()
	BgMusic.stream = noice_start
	BgMusic.autoplay = false
	BgMusic.play()
	BgMusic.connect("finished",_on_bgmusic_finished)


func _on_bgmusic_finished() -> void:
	BgMusic.stop()
	BgMusic.stream = noice
	BgMusic.autoplay = true
	BgMusic.play()


func _on_tree_exiting() -> void:
	BgMusic.stop()
	BgMusic.stream = default_music
	BgMusic.autoplay = true
	BgMusic.play()

