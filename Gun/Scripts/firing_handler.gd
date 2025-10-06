extends Node

@export var data : GunData
@export var fire_point : Marker2D

var projectile_scene : PackedScene
var parent : Node2D
var projectile_container : Node

func _ready() -> void:
	projectile_scene = data.projectile
	projectile_container = get_tree().current_scene.get_node("Projectile Container")
	
	parent = get_parent()
	
	EventBus.left_click.connect(shoot)
	
func shoot(_global_position : Vector2) -> void:
	var projectile : Node2D = projectile_scene.instantiate()
	
	projectile.global_position = fire_point.global_position
	projectile.global_rotation = parent.global_rotation
	projectile_container.add_child(projectile)
