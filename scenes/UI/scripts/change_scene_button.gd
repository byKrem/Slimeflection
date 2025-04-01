class_name ChangeSceneButton
extends Button

@export var new_scene: PackedScene
@export var new_scene_file_path: String

func _on_pressed() -> void:
	get_tree().paused = false
	if new_scene:
		get_tree().change_scene_to_packed(new_scene)
	elif new_scene_file_path:
		get_tree().change_scene_to_file(new_scene_file_path)
