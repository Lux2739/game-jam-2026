extends CharacterBody2D

# ---- Config ----
@export var speed: float = 300          # Vitesse de déplacement
@export var jump_velocity: float = -500 
@export var gravity: float = 1200       # Gravité

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

	# ----- Appliquer mouvement -----
	move_and_slide()
