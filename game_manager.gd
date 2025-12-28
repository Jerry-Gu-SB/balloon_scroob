extends Node

func _ready() -> void:
	EventBus.player_death.connect(_handle_player_death)
	
func _handle_player_death() -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
