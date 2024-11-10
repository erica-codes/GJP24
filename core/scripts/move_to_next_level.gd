extends Area2D
@onready var camera_3d: Camera3D = $main3dcam

func change_level():
	
	var level1_scene = preload("res://core/scenes/level1_3D.tscn")
	get_tree().change_scene_to_file("res://core/scenes/level1_3D.tscn")
	

func _on_body_entered(body: Node) -> void:
	print("Body detected:", body.name, "Type:", body.get_class())
	if body.name == "fish" and body is CharacterBody2D:  
		print("Player detected, changing scene...")
		change_level()
