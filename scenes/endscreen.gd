extends Control

@onready var time_label: Label = $TimeLabel

func _ready():
	if time_label:
		time_label.text = "Temps final : " + GameTimer.get_time_text()
	else:
		print("Erreur : TimeLabel non trouvé dans EndScreen.tscn")

func _on_MenuButton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
