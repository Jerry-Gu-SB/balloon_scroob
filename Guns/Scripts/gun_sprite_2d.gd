extends AnimatedSprite2D

func _ready() -> void:	
	EventBus.left_click.connect(process_left_click)
	animation_finished.connect(on_animation_finished)
	
func _process(_delta : float) -> void:
	var mouse_position = get_global_mouse_position()
	
	# Flip the gun sprite based on mouse orientation vs the player
	if ((mouse_position[0] - self.global_position[0]) * self.scale.y) < 0:
		self.scale.y *= -1
		
func process_left_click() -> void:
	self.play("fire")
	return

func on_animation_finished() -> void:
	self.play("default")
	return
