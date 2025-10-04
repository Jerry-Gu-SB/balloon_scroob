extends Node2D

@onready var input_handler = $"Input Handler"
@onready var physics_handler = $"Physics Handler"
@onready var character_body = $"CharacterBody2D"

var current_input : Vector2

func _ready():
	input_handler.connect("left_click", process_left_click)
	
func _process(_delta : float) -> void:
	current_input = input_handler.update()
	physics_handler.update(current_input, character_body)

func process_left_click(mouse_position : Vector2) -> void:
	print("left click processed at: " + str(mouse_position))
	return
