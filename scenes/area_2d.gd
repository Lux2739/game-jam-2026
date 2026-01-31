extends Area2D
# Node2D qui contient toutes les plateformes à révéler
@export var platforms_parent: Node2D
func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	print("BODY ENTERED :", body.name)
	platforms_parent.visible = true
func _on_body_exited(body):
	print("BODY Exited :", body.name)
	platforms_parent.visible = false
	
