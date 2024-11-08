extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -290.0  
const MAX_JUMPS = 2 
var jump_count = 0  

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY  # Apply the jump velocity
		jump_count += 1  # Increment the jump counter

	if is_on_floor():
		jump_count = 0

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
