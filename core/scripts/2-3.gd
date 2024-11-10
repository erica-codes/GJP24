extends Area2D

@onready var collision_area: Area2D = $Area2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node) -> void:
	print("Body detected: " + body.name)  # Debug message to confirm detection
	if body.name == "fish":
		print("Player (fish) detected, changing scene...")
		_change_scene()

func _change_scene() -> void:
	var new_scene = preload("res://core/scenes/level3.tscn").instantiate()
	get_tree().current_scene.queue_free()  # Free the current scene
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
