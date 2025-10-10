extends Node

@export var fire_point : Marker2D

var data : GunData
var parent : GunProvider
var projectile_scene : PackedScene
var projectile_container : Node

func _ready() -> void:
	parent = get_parent() as GunProvider
	data = parent.get_gun_data()
	
	projectile_scene = data.projectile
	projectile_container = get_tree().current_scene.get_node("Projectile Container")
	
	EventBus.left_click.connect(shoot)
	
func shoot() -> void:
	var projectile : Node2D = projectile_scene.instantiate()
	
	projectile.global_position = fire_point.global_position
	projectile.global_rotation = parent.global_rotation
	projectile_container.add_child(projectile)
