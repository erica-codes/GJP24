extends Area2D

@onready var timer: Timer = $"../Timer"

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "fish":  # Replace "PlayerFish" with your player's name if necessary
		timer.start()
