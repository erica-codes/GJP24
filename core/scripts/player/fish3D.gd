extends CharacterBody3D

const SPEED = 10.0
const JUMP_VELOCITY = Vector3(0, 7.0, 0)
const MAX_JUMPS = 2
var jump_count = 0

var smooth_rotation_speed = 5.0
var smooth_move_speed = 0.1

var target_velocity = Vector3.ZERO
var target_rotation = Vector3.ZERO


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY.y
		jump_count += 1

	if is_on_floor():
		jump_count = 0

	var direction = Vector3(
		Input.get_axis("left", "right"),
		0,
		Input.get_axis("up", "down")
	).normalized()

	if direction.length() > 0:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		rotate_character(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta)

	move_and_slide()

func rotate_character(direction: Vector3) -> void:
	var target_y_rotation = atan2(direction.x, direction.z)
	rotation.y = lerp_angle(rotation.y, target_y_rotation, smooth_rotation_speed * get_physics_process_delta_time())
