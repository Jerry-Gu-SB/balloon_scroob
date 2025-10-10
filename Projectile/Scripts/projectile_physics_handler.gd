extends Node

var parent_node : ProjectileProvider

func _ready() -> void:
	parent_node = get_parent()
	
func _process(delta) -> void:
	parent_node.position += parent_node.transform.x * parent_node.get_projectile_data().projectile_velocity * delta
