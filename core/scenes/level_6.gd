extends Node2D

func _on_returntomenu_pressed() -> void:
	get_tree().change_scene_to_file("res://core/scenes/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
