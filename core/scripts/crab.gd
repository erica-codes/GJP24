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
	rng.randomizer()
	input_direction_x = 1
	state = states.WALK
	$MoveTimer.start()

func get_random_direction() -> int:
	pass

func set_direction_right() -> void:
	pass

func set_direction_left() -> void:
	pass

func update_direction(direction_x) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	match state:
		states.WALK:
			$AnimatedSprite2D.play("Walk")
			update_direction(input_direction_x)
			pass
		
		states.DEATH:
			pass
	pass

func apply_gravity(delta) -> void:
	pass
