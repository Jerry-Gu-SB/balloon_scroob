extends Node2D

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")

func _on_last_checkpoint_button_pressed() -> void:
	get_tree().change_scene_to_file("res://root.tscn")
