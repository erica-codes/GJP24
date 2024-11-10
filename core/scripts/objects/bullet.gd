extends CharacterBody2D

class_name Bullet

@export var speed = 500.0
@onready var sprite = $Sprite2D  # Adjust this if you're using a Sprite2D or AnimatedSprite2D node
@onready var collision_area = $Area2D
@onready var timer = $Timer

func _ready() -> void:
	timer.start()

func _process(delta: float) -> void:
	var custom_velocity = Vector2(speed, 0)
	if sprite.flip_h:
		custom_velocity.x = -speed

	velocity = custom_velocity  # Set the velocity to move the bullet
	move_and_slide()  # Call move_and_slide without any arguments

func _on_Timer_timeout() -> void:
	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()
