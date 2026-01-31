extends Node

var time: float = 0.0
var running: bool = false

func start():
	time = 0.0
	running = true

func stop():
	running = false

func _process(delta):
	if running:
		time += delta

func get_time_text() -> String:
	var minutes = int(time) / 60
	var seconds = int(time) % 60
	var millis = int((time - int(time)) * 100)

	return "%02d:%02d:%02d" % [minutes, seconds, millis]
