extends Node

var velocity : Vector2 = Vector2.ZERO
var gravity : Vector2 = Vector2(0.0, -1.05)

const AIR_DRAG : float = .99
const INPUT_MULTIPLYER = 2.5
const MAX_SPEED = 250

func update(input_vector : Vector2, character_body : CharacterBody2D) -> void:
	# apply_impulse()
	resolve_input(input_vector)
	resolve_environmental_forces()
	apply_physics(character_body)
	return

func apply_impulse(impulse_vector_normalized : Vector2, impulse_strength : float) -> void:
	velocity += impulse_vector_normalized * impulse_strength
	return

func resolve_input(input_vector : Vector2) -> void:
	if abs(velocity[0]) < MAX_SPEED:
		velocity[0] += input_vector[0] * INPUT_MULTIPLYER
	if abs(velocity[1]) < MAX_SPEED:
		velocity[1] += input_vector[1] * INPUT_MULTIPLYER
	
func resolve_environmental_forces() -> void:
	velocity += gravity
	velocity *= AIR_DRAG
	
func apply_physics(character_body : CharacterBody2D) -> void:
	character_body.velocity = velocity
	character_body.move_and_slide()
