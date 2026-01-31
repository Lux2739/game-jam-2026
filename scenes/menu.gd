extends Control
@onready var first_level = preload("res://scenes/level_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_down() -> void:
	GameTimer.start()
	get_tree().change_scene_to_packed(first_level)


func _on_quit_button_down() -> void:
	get_tree().quit()
