extends Area2D

func _ready():
	# On connecte le signal programmatique
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.has_method("die"):
		body.die()  # Appelle la fonction die() du Player
	else:
		print("Body sans die() :", body.name)
