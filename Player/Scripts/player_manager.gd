extends Node2D

@onready var input_handler = $"Input Handler"
@onready var physics_handler = $"Physics Handler"
@onready var character_body = $"CharacterBody2D"
@onready var weapon_socket = $"Weapon Socket"
@onready var animated_sprite_2d : AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D
var current_input : Vector2

func _ready():
	EventBus.fire_gun.connect(process_fire_gun)
	
	assert(input_handler != null, "Missing node: Input Handler")
	assert(physics_handler != null, "Missing node: Physics Handler")
	assert(character_body != null, "Missing node: CharacterBody2D")
	assert(weapon_socket != null, "Missing node: Weapon Socket")
	assert(animated_sprite_2d != null, "Missing node: AnimatedSprite2D")
	
	animated_sprite_2d.play("idle")
	
func _process(_delta : float) -> void:
	current_input = input_handler.update()
	physics_handler.update(current_input, character_body)

func process_fire_gun() -> void:
	var weapon_data : GunData = weapon_socket.get_weapon_data()
	assert(weapon_data != null, "Weapon data is null in player_manager.gd: process_left_click()")
	
	var recoil_direction : Vector2 = -Vector2.RIGHT.rotated(weapon_socket.global_rotation)
	physics_handler.apply_impulse(recoil_direction.normalized(), weapon_data.recoil_strength)
