extends Sprite2D

func _ready() -> void:
	var parent : GunProvider = get_parent()
	self.texture = parent.get_gun_data().sprite_texture
	
func _process(_delta : float) -> void:
	var mouse_position = get_global_mouse_position()
	self.flip_v = mouse_position[0] < self.global_position[0]
