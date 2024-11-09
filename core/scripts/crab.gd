extends CharacterBody2D

class_name Enemy
@export var gravity := 1000.0
@export var walk_speed := 75

var state
var direction: String = "right"
var rng = RandomNumberGenerator.new()

var input_direction_x

enum states{
	WALK,
	DEATH
}

func _ready() -> void:
	print("enemy start")
	rng.randomize()
	input_direction_x = 1
	state = states.WALK
	$MoveTimer.start()

func get_random_direction() -> int:
	var random_number = rng.randi_range(0,1)
	return[-1, 1][random_number]

func set_direction_right() -> void:
	direction = "right"
	$AnimatedSprite2D.flip_h = false

func set_direction_left() -> void:
	direction = "left"
	$AnimatedSprite2D.flip_h = true

func update_direction(direction_x) -> void:
	if direction_x > 0:
		set_direction_right()
	elif direction_x < 0:
		set_direction_left()


func _physics_process(delta: float) -> void:
	match state:
		states.WALK:
			$AnimatedSprite2D.play("Walk")
			update_direction(input_direction_x)
			velocity.x = walk_speed * input_direction_x * delta
			apply_gravity(delta)
			move_and_slide()
		
		states.DEATH:
			$AnimatedSprite2D.play("Death")
			$body.disabled = true
			await $AnimatedSprite2D.animation_finished
			queue_free()

func apply_gravity(delta) -> void:
	velocity.y += gravity * delta

func _on_move_timer_timeout() -> void:
	input_direction_x = get_random_direction()

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.owner is Player:
		state = states.DEATH
