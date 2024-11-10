extends Control

var audio_stream = preload("res://assets/sounds/3dandmaintheme.wav")
@onready var audio_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not audio_player.playing:
		audio_player.play()
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://core/scenes/tutorial.tscn")
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://core/scenes/UI/credits.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
