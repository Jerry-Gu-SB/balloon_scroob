extends Node2D

func _on_start_button_pressed() -> void:
	GlobalVariables.LastCheckpoint = Vector2(0, 0)
	get_tree().change_scene_to_file("res://root.tscn")
