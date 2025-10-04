extends Node2D

@onready var projectile_area2d = $"../Area2D"

@export var projectile_velocity : float = 1

func _ready() -> void:
	return

func _process(delta) -> void:
	projectile_area2d.position += projectile_area2d.transform.x * projectile_velocity * delta
	return
