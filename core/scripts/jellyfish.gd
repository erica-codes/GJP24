extends AnimatableBody2D

@export var move_duration: float = 2.0  
@export var start_position: Vector2 = Vector2(777, 652)  
@export var end_position: Vector2 = Vector2(777, -12)  
@export var respawn_position: Vector2 = Vector2(777, 652)  

@onready var sprite = $Sprite2D  
@onready var visibility_notifier = $VisibilityNotifier2D  

func _ready():
	position = start_position  
	move_to_end()  

func move_to_end():
	print("Moving to end position")
	var tween = create_tween()
	tween.tween_property(self, "position", end_position, move_duration)
	tween.finished.connect(despawn)  

func despawn():
	print("Despawning...")
	sprite.visible = false  
	await get_tree().create_timer(1.0).timeout  
	respawn()  

func respawn():
	print("Respawning...")
	position = respawn_position  
	sprite.visible = true  
	move_to_end()  

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	print("Entered screen")
	sprite.visible = true  

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Exited screen")
	sprite.visible = false  
