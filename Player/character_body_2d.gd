extends CharacterBody2D

var last_checkpoint : Vector2 = Vector2(0, 0)

func _ready() -> void:
	EventBus.checkpoint_reached.connect(process_checkpoint_reached)
	
func _process(_delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Hazards":
			EventBus.player_death.emit()
			set_collision_mask_value(GlobalVariables.CollisionLayers.Hazards, false)

func process_checkpoint_reached(checkpoint_position : Vector2) -> void:
	last_checkpoint = checkpoint_position
