extends AnimatedSprite2D

func _ready() -> void:
	EventBus.player_death.connect(process_player_death)
	
func process_player_death() -> void:
	self.play("death")
