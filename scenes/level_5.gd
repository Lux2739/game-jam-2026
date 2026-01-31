extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@onready var timer_label: Label = $TimerLabel5

func _process(_delta):
	timer_label.text = GameTimer.get_time_text()
