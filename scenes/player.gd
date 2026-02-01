extends CharacterBody2D

# ---- CONFIG ----
@export var speed: float = 300
@export var jump_velocity: float = -600
@export var gravity: float = 2200

# ---- DOUBLE JUMP REACTIF ----
@export var jump_buffer_time: float = 0.15  # mémoire du saut
@export var coyote_time: float = 0.1        # temps après le sol où le jump est autorisé

# ---- ETAT ----
var double_jump := 1
var spawn_position: Vector2

var jump_buffer_timer := 0.0
var coyote_timer := 0.0

@onready var sprite: Sprite2D = $Sprite2D

# --- Définir le spawn point ---
func set_spawn(pos: Vector2) -> void:
	spawn_position = pos
	print("Spawn défini :", spawn_position)

# --- Mort / respawn ---
func die() -> void:
	print("PLAYER DIED")
	global_position = spawn_position
	velocity = Vector2.ZERO

# --- DEPLACEMENT ---
func _physics_process(delta: float) -> void:
	if get_tree().paused:
		return  # sécurité pause

	# --- INPUT HORIZONTAL ---
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# --- GRAVITE ---
	if not is_on_floor():
		velocity.y += gravity * delta
		coyote_timer -= delta
	else:
		velocity.y = 0
		coyote_timer = coyote_time
		double_jump = 1  # reset double jump au sol

	# --- JUMP BUFFERING ---
	if Input.is_action_just_pressed("ui_up"):
		jump_buffer_timer = jump_buffer_time
	else:
		jump_buffer_timer -= delta

	# --- SAUT ---
	if jump_buffer_timer > 0:
		if is_on_floor() or coyote_timer > 0:
			velocity.y = jump_velocity
			jump_buffer_timer = 0
		elif double_jump > 0:
			velocity.y = jump_velocity
			double_jump -= 1
			jump_buffer_timer = 0

	# --- APPLIQUER MOUVEMENT ---
	move_and_slide()

	# --- ORIENTATION SPRITE ---
	if direction != 0:
		sprite.scale.x = abs(sprite.scale.x) * -sign(direction)
