extends CharacterBody2D

class_name Player

const SPEED = 250.0
const JUMP_VELOCITY = -290.0  
const MAX_JUMPS = 2
var jump_count = 0  

@onready var fish = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY  
		jump_count += 1  

	if is_on_floor():
		jump_count = 0
		
	var direction := Input.get_axis("left", "right")
	
	if direction != 0:
		velocity.x = direction * SPEED  
		fish.flip_h = direction < 0	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("spit"):
		$AnimationPlayer.play("spit")
		
	move_and_slide()
