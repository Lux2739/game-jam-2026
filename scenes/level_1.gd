# Level.gd
extends Node2D
# On peut exporter les zones et plateformes si besoin
@export var reveal_zones: Array[NodePath] = []

func _ready():
	# On pourrait initialiser les zones si nécessaire
	for zone_path in reveal_zones:
		var zone = get_node(zone_path)
		if zone:
			# Chaque zone pourrait être paramétrée ici
			pass
			
