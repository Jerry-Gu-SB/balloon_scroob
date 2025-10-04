extends Node

@export var data : ProjectileData
var parent_node : Node2D

func _ready() -> void:
	parent_node = get_parent()
	
func _process(delta) -> void:
	parent_node.position += parent_node.transform.x * data.projectile_velocity * delta
	return
