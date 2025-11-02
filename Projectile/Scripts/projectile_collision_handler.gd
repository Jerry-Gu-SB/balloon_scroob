extends Node

@onready var hurtbox : Area2D = $"../Hurtbox"
@onready var explosion_area : Area2D = $"../Explosion Area"

func _ready() -> void:
	hurtbox.body_entered.connect(on_body_entered)

func on_body_entered(collision) -> void:
	if collision.has_method("take_damage"):
		var parent : ProjectileProvider = get_parent()
		collision.take_damage(parent.get_projectile_data().damage)
		queue_free()
		
func get_all_collisions() -> void:
	explosion_area.get_overlapping_areas()
