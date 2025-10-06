extends Sprite2D

@export var data : ProjectileData

func _ready() -> void:
	self.texture = data.sprite_texture
