extends VBoxContainer


@export var new_scene: PackedScene
@export var new_scene_file_path: String


func _ready():
	var next_btn : ChangeSceneButton = $"HBoxContainer/NextLevel"
	if new_scene:
		next_btn.new_scene = new_scene
	elif new_scene_file_path:
		next_btn.new_scene_file_path = new_scene_file_path
	else:
		next_btn.hide()