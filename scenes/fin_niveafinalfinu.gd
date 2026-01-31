extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_body_entered(_body):
	GameTimer.stop()
	print("Temps final :", GameTimer.get_time_text())
