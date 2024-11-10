extends RichTextLabel

@export var speed := 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speed > 0:
		speed -= 1 
