extends Node

@onready var area2D : Area2D = $"../Area2D"

func _ready() -> void:
	area2D.body_entered.connect(on_body_entered)

func on_body_entered(collision) -> void:
	if collision.has_method("take_damage"):
		var parent : ProjectileProvider = get_parent()
		collision.take_damage(parent.get_projectile_data().damage)
		queue_free()
