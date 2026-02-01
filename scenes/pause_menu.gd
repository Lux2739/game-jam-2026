extends Control

func _on_resume_button_button_down() -> void:
	get_tree().paused = false
	queue_free()


func _on_main_menu_button_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
