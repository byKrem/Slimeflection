extends Node

func _ready():
	$YourNotAloneLabel.visible = false
	$TryToJumpLabel.visible = false
	$HelpYourFriendLabel.visible = false
	$HighWall2Label.visible = false

func _on_your_not_alone_body_entered(body:Node2D) -> void:
	if body:
		$YourNotAloneLabel.visible = true


func _on_try_to_jump_body_entered(body: Node2D) -> void:
	if body:
		$TryToJumpLabel.visible = true


func _on_help_your_friend_body_entered(body: Node2D) -> void:
	if body:
		$HelpYourFriendLabel.visible = true


func _on_high_wall_body_entered(body:Node2D) -> void:
	if body:
		$HighWall2Label.visible = true
