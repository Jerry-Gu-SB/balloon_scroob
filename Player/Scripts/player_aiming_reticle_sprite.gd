extends Sprite2D

func _process(_delta) -> void:
	self.global_position = get_global_mouse_position()
