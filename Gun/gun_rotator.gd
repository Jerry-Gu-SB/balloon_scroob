extends Node2D

@export var parent : Node2D

var mouse_position : Vector2
var parent_position : Vector2

func _ready() -> void:
	parent = get_parent()
	
func _process(_delta) -> void:
	mouse_position = get_global_mouse_position()
	parent.global_rotation = parent_position.angle_to_point(mouse_position)
