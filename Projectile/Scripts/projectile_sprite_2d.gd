extends Sprite2D

func _ready() -> void:
	var parent : ProjectileProvider = get_parent()
	self.texture = parent.get_projectile_data().sprite_texture
