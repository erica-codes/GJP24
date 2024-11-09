extends RigidBody3D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("left", "right")
	input.z = Input.get_axis("up", "down")
	
	apply_central_force(input * 600.0 * delta)
