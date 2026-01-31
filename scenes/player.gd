extends CharacterBody2D

@export var speed: float = 300
@export var jump_velocity: float = -600
@export var gravity: float = 2200

var double_jump := 1
var spawn_position: Vector2  # Point où le joueur respawnera

@onready var sprite: Sprite2D = $Sprite2D

# --- Définir le spawn point
func set_spawn(pos: Vector2) -> void:
	spawn_position = pos
	print("Spawn défini :", spawn_position)

# --- Mort / respawn
func die() -> void:
	print("PLAYER DIED")
	global_position = spawn_position
	velocity = Vector2.ZERO

# --- Déplacement
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_velocity
			double_jump = 1
		elif double_jump == 1:
			velocity.y = jump_velocity
			double_jump = 0

	move_and_slide()

	if direction != 0:
		sprite.scale.x = abs(sprite.scale.x) * -sign(direction)
