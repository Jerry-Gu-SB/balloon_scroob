extends CharacterBody2D

func _process(_delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("Collided with: ", collision.get_collider().name)
		if collision.get_collider().name == "Hazards":
			EventBus.player_death.emit()
