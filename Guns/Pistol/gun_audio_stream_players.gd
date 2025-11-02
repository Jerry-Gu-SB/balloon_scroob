extends Node

@onready var gunshot_sfx : AudioStreamPlayer = $GunShot

func _ready() -> void:
	EventBus.fire_gun.connect(process_fire_gun)
	
func process_fire_gun() -> void:
	gunshot_sfx.play()
