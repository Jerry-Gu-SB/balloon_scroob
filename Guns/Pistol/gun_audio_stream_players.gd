extends Node

@onready var gunshot_sfx : AudioStreamPlayer = $GunShot

@export var pitch_scale_strength : float = .05

func _ready() -> void:
	EventBus.fire_gun.connect(process_fire_gun)
	
func process_fire_gun() -> void:
	gunshot_sfx.pitch_scale = randf_range(1 - pitch_scale_strength, 1 + pitch_scale_strength)
	gunshot_sfx.play()
