extends CharacterBody2D

# ---- Config ----
@export var speed: float = 300          # Vitesse de déplacement
@export var jump_velocity: float = -500 
@export var gravity: float = 1200       # Gravité
var double_jump: int = 1;
# Ajouter ceci en haut, après les variables
@onready var sprite = $Sprite2D  # Assure-toi que c’est bien le chemin vers ton sprite

func _physics_process(delta):
	# ----- Mouvement horizontal -----
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed

	# ----- Gravité -----
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Reset vertical velocity when on floor
		velocity.y = 0

	# ----- Saut -----
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
		double_jump = 1
		
	if Input.is_action_just_pressed("ui_up") and !is_on_floor():
		if double_jump==1: 
			double_jump = 0
			velocity.y = jump_velocity

	# ----- Appliquer mouvement -----
	move_and_slide()
	# À la fin de _physics_process(delta), après move_and_slide()
	if direction != 0:
		sprite.scale.x = abs(sprite.scale.x) * -sign(direction)
