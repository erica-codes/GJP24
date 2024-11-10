extends Area2D

@onready var timer_2d: Timer = $"../Timer2d"

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "fish":
		timer_2d.start()

func _on_timer_2d_timeout() -> void:
	get_tree().reload_current_scene()
	
