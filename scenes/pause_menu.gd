extends Control

func _ready():
	# Connecter les boutons
	$Panel/VBoxContainer/ResumeButton.pressed.connect(_on_resume_pressed)
	$Panel/VBoxContainer/MainMenuButton.pressed.connect(_on_main_menu_pressed)
	
	# Commence caché
	visible = false

# --- Appuyer sur "Reprendre"
func _on_resume_pressed():
	hide()
	get_tree().paused = false

# --- Appuyer sur "Menu Principal"
func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/MainMenu.tscn")  # Mettre le chemin de ton menu principal
