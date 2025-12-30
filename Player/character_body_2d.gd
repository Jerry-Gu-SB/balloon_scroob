extends CharacterBody2D

func _ready() -> void:
	print("before: ", position)
	position = GlobalVariables.LastCheckpoint
	print("after: ", position)
	EventBus.checkpoint_reached.connect(process_checkpoint_reached)
	
func _process(_delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Hazards":
			EventBus.player_death.emit()
			set_collision_mask_value(GlobalVariables.CollisionLayers.Hazards, false)

func process_checkpoint_reached(checkpoint_position : Vector2) -> void:
	GlobalVariables.LastCheckpoint = checkpoint_position
