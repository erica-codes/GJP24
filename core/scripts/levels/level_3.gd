extends Node2D

var visible_characters = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible_characters != $RichTextLabel.visible_characters:
		visible_characters = $RichTextLabel.visible_characters
		$AudioStreamPlayer.play()
