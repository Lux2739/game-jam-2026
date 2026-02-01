extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@onready var timer_label: Label = $TimerLabel5
@onready var pause_scene = preload("res://scenes/pause_menu.tscn")
var pause_instance: Control = null

func toggle_pause():
	if get_tree().paused:
		get_tree().paused = false
		if pause_instance:
			pause_instance.queue_free()
	else:
		get_tree().paused = true
		pause_instance = pause_scene.instantiate()
		add_child(pause_instance)

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()
func _process(_delta):
	timer_label.text = GameTimer.get_time_text()
