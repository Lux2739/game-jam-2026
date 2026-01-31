extends Node2D

@onready var spawn = $SpawnPoint  # Marker2D du spawn

@onready var timer_label: Label = $TimerLabel

func _process(_delta):
	timer_label.text = GameTimer.get_time_text()
func _ready():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.set_spawn(spawn.global_position)
	else:
		print("ERREUR : Player non trouvé !")
