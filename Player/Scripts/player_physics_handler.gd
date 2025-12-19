extends Node

var velocity : Vector2 = Vector2.ZERO
var gravity : Vector2 = Vector2(0.0, -1.05)
var wind : Vector2 = Vector2(0, 0)

const AIR_DRAG : float = .99
const INPUT_MULTIPLYER = 2.5
const MAX_SPEED = 250

func _ready() -> void:
	EventBus.change_wind.connect(_handle_change_wind_signal)
	
func _handle_change_wind_signal(new_wind : Vector2) -> void:
	wind = new_wind

func update(input_vector : Vector2, character_body : CharacterBody2D) -> void:
	_resolve_input(input_vector)
	_resolve_environmental_forces()
	_apply_physics(character_body)

func _resolve_input(input_vector : Vector2) -> void:
	if abs(velocity[0]) < MAX_SPEED:
		velocity[0] += input_vector[0] * INPUT_MULTIPLYER
	if abs(velocity[1]) < MAX_SPEED:
		velocity[1] += input_vector[1] * INPUT_MULTIPLYER
	
func _resolve_environmental_forces() -> void:
	velocity += gravity
	velocity += wind
	velocity *= AIR_DRAG
	
func _apply_physics(character_body : CharacterBody2D) -> void:
	character_body.velocity = velocity
	character_body.move_and_slide()
	
func apply_impulse(impulse_vector_normalized : Vector2, impulse_strength : float) -> void:
	if not impulse_vector_normalized.is_normalized():
		impulse_vector_normalized = impulse_vector_normalized.normalized()
	velocity += impulse_vector_normalized * impulse_strength
