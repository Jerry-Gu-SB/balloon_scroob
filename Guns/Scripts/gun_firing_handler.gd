extends Node

@export var fire_point : Marker2D

var data : GunData
var parent : GunProvider
var projectile_scene : PackedScene
var projectile_container : Node

var on_cooldown : bool = false
var fire_cooldown_timer : float = 0

func _ready() -> void:
	parent = get_parent() as GunProvider
	data = parent.get_gun_data()
	
	projectile_scene = data.projectile
	projectile_container = get_tree().current_scene.get_node("Projectile Container")
	
	EventBus.left_click.connect(process_left_click)
	
func _process(delta: float) -> void:
	if on_cooldown:
		fire_cooldown_timer += delta
	if fire_cooldown_timer >= data.fire_rate:
		fire_cooldown_timer = 0
		on_cooldown = false
	
func process_left_click() -> void:
	if on_cooldown: return
	shoot()
	on_cooldown = true

func shoot() -> void:
	EventBus.fire_gun.emit()
	var projectile : Node2D = projectile_scene.instantiate()
	
	projectile.global_position = fire_point.global_position
	projectile.global_rotation = parent.global_rotation
	projectile_container.add_child(projectile)
