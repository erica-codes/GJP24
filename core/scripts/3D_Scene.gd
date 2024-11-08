extends Node3D

func _ready() -> void:
	# start with the 2D scene loaded by default
	get_tree().change_scene_to_file("res://2D_Scene.tcsn")

func load_scene(scene_path: String): # function to load scene dynamically
	var new_scene = load(scene_path).instantiate()
	get_tree().current_scene.free()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene

func switch_to_2d():
	load_scene("res://2D_Scene.tscn")

func switch_to_3d():
	load_scene("res://3D_Scene.tscn")
