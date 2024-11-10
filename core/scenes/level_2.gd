extends Node2D


# Called when the node enters the scene tree for the first time.
var audio_stream = preload("res://assets/sounds/2dtheme.wav")
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
