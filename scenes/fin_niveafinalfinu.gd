extends Area2D
@export var end = preload("res://scenes/endscreen.tscn")
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	GameTimer.stop()
	get_tree().change_scene_to_packed(end)
