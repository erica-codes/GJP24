extends AnimatableBody2D

@export var move_duration: float = 2.0  
@export var start_position: Vector2 = Vector2(777, 652)  
@export var end_position: Vector2 = Vector2(777, -12)  
@export var respawn_position: Vector2 = Vector2(777, 652)  
@export var jellyfish_scene: PackedScene = preload("res://core/scenes/enemies/jellyfish.tscn")  

@onready var sprite = $AnimatedSprite2D
@onready var visibility_notifier = $VisibilityNotifier2D  

func _ready():
	position = start_position  
	move_to_end()  

func move_to_end():
	var tween = create_tween()
	tween.tween_property(self, "position", end_position, move_duration)
	tween.finished.connect(despawn)  

func despawn():
	sprite.visible = false  
	await get_tree().create_timer(1.0).timeout  
	create_new_jellyfish()

func create_new_jellyfish():
	var new_jellyfish = jellyfish_scene.instantiate()
	new_jellyfish.position = respawn_position
	get_tree().current_scene.add_child(new_jellyfish)  
	queue_free() 

func respawn():
	position = respawn_position  
	sprite.visible = true  
	move_to_end()  

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	sprite.visible = true  

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	sprite.visible = false  
