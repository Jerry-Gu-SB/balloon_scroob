extends Sprite2D

@export var data : GunData

func _ready() -> void:
	self.texture = data.sprite_texture
