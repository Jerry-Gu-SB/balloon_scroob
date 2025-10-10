extends Node2D

@onready var character_body : CharacterBody2D = $"../CharacterBody2D"

var mouse_position : Vector2

func _process(_delta: float) -> void:
	assert(get_child_count() == 1, "Incorrect child count in weapon socket! Child count: " + str(get_child_count()))
	
	mouse_position = get_global_mouse_position()
	self.global_position = character_body.global_position
	self.global_rotation = self.global_position.angle_to_point(mouse_position)

func get_weapon_data() -> GunData:
	var weapon : GunProvider = get_child(0)
	assert(weapon != null, "Weapon socket couldn't find a weapon!")
	return weapon.get_gun_data()
	
