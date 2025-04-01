extends PanelContainer


func pause():
	self.visible = true
	get_tree().paused = true


func resume():
	self.visible = false
	get_tree().paused = false


func _ready() -> void:
	self.visible = false


func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		if self.visible:
			resume()
		else:
			pause()


func _on_resume_button_up() -> void:
	get_tree().paused = false
	self.hide()


func _on_restart_button_up() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
