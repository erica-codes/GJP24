extends MeshInstance3D

@onready var collision_area = $Area3D  
@onready var collectable_shape = $Area3D/CollisionShape3D 
var rotation_speed = 30.0

func _ready() -> void:
	rotation_degrees = Vector3.ZERO

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(rotation_speed) * delta)

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Body entered:", body.name)  
	if body.name == "fish":  
		print("Player detected, changing scene...")
		collect_item()

func collect_item():
	print("item collected, changing to 2D scene..")
	var new_scene = preload("res://core/scenes/level2.tscn").instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
	await get_tree().process_frame
	queue_free()  
