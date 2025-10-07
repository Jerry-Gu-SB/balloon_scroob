extends Node2D

@onready var character_body : CharacterBody2D = $"../CharacterBody2D"

var mouse_position : Vector2

func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	self.global_position = character_body.global_position
	self.global_rotation = self.global_position.angle_to_point(mouse_position)
