extends Node

var wind_vector : Vector2
var timer : float = 0
var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if timer <= 0:
		set_wind(Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1)))
		timer = rng.randf_range(3, 10)
	timer -= delta
		
func set_wind(wind_value : Vector2) -> void:
	wind_vector = wind_value
	EventBus.change_wind.emit(wind_vector)
	
