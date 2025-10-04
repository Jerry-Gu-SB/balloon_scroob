extends Node

var velocity : Vector2 = Vector2.ZERO
var gravity : Vector2 = Vector2(0.0, -.1)

const AIR_DRAG : Vector2 = Vector2(1, 1)
const INPUT_MULTIPLYER = 2.5
const MAX_SPEED = 250

func update(input_vector : Vector2, character_body : CharacterBody2D) -> void:
	resolve_input(input_vector)
	resolve_physics(character_body)
	return

func resolve_input(input_vector : Vector2) -> void:
	if abs(velocity[0]) < MAX_SPEED:
		velocity[0] += input_vector[0] * INPUT_MULTIPLYER
	if abs(velocity[1]) < MAX_SPEED:
		velocity[1] += input_vector[1] * INPUT_MULTIPLYER
	
func resolve_physics(character_body : CharacterBody2D) -> void:
	velocity += gravity
	
	velocity[0] = move_towards_zero(velocity[0], AIR_DRAG[0])
	velocity[1] = move_towards_zero(velocity[1], AIR_DRAG[1])
	
	character_body.velocity = velocity
	character_body.move_and_slide()
	
func move_towards_zero(value: float, step: float) -> float:
	if abs(value) <= step:
		return 0.0
	return value - step * sign(value)
	
