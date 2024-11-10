extends CharacterBody2D

class_name Player

const SPEED = 250.0
const JUMP_VELOCITY = -290.0  
const MAX_JUMPS = 2
var jump_count = 0  

@onready var fish = $AnimatedSprite2D
@onready var projectile = load("res://core/scenes/bullet.tscn")
@onready var main = get_tree().get_root().get_node("fish")
var audio_stream = preload("res://assets/sounds/3dandmaintheme.wav")
@onready var audio_player = $AudioStreamPlayer


var shoot_direction = Vector2(1, 0)  # Initial direction of the bullet (right)

func _ready() -> void:
	# Initialize shoot direction based on player facing direction
	if fish.flip_h:
		shoot_direction.x = -1  # Flip direction if player faces left

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("spit"):
		spit()
	
	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		audio_player.play()
		velocity.y = JUMP_VELOCITY  
		jump_count += 1  

	if is_on_floor():
		jump_count = 0
		
	var direction := Input.get_axis("left", "right")
	
	if direction != 0:
		velocity.x = direction * SPEED  
		fish.flip_h = direction < 0	
		shoot_direction.x = -1 if direction < 0 else 1  # Adjust shoot direction when facing left or right
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func spit(): 
	# Instantiate the bullet scene
	var bullet_instance = projectile.instantiate()
	
	
	
	# Set the bullet's position to the player's position
	bullet_instance.position = position + Vector2(20, 0)  # Offset the bullet slightly from the player
	
	# Set the bullet's direction (shoot it in the direction the player is facing)
	bullet_instance.velocity = shoot_direction * 500  # Adjust bullet speed as needed
	get_tree().current_scene.add_child(bullet_instance)
