extends Area2D

func change_level():
	#transition
	var level1_scene = preload("res://core/scenes/level1_3D.tscn")
	get_tree().change_scene_to_file("res://core/scenes/level1_3D.tscn")	
	
	#clear up memory
	await get_tree().idle_frame()
	
	var current_scene = get_tree().current_scene
	if current_scene:
		current_scene.queue_free()
		print("Previous scene freed.")

func _on_body_entered(body: Node) -> void:
	print("Body detected:", body.name, "Type:", body.get_class())
	if body.name == "fish" and body is CharacterBody2D:  
		print("Player detected, changing scene...")
		change_level()
