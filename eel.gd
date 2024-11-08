extends StaticBody2D

@export var move_duration: float = 2.0 
@export var wait_duration: float = 1.0  
@export var start_position: Vector2 = Vector2(1115, 563)  
@export var center_position: Vector2 = Vector2(500, 563)  
@export var end_position: Vector2 = Vector2(-50, 563)  

func _ready():
	position = start_position
	move_to_center()

func move_to_center():
	var tween = create_tween()
	tween.tween_property(self, "position", center_position, move_duration)
	tween.finished.connect(wait_in_center)

func wait_in_center():
	await get_tree().create_timer(wait_duration).timeout
	move_out()

func move_out():
	var tween = create_tween()
	tween.tween_property(self, "position", end_position, move_duration)
	tween.finished.connect(reset_position)

func reset_position():
	position = start_position
	move_to_center()
