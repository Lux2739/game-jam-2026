extends Area2D

@export var next_level_path = preload("res://scenes/level_2.tscn")
func _ready():
	body_entered.connect(_on_body_entered)
func _on_body_entered(body):
	print("BODY ENTERED :", body.name)
	get_tree().change_scene_to_packed(next_level_path)
	
