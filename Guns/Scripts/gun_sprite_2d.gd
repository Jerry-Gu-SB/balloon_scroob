extends Sprite2D

func _ready() -> void:
	var parent : GunProvider = get_parent()
	self.texture = parent.get_gun_data().sprite_texture
