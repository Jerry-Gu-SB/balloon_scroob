extends Node2D

@onready var explosion_area : Area2D = $"../Explosion Area"

var projectile_damage : int
var tilemap: TileMapLayer

const TILEMAP_LAYER_NAME := "Breakable Terrain"

func _ready() -> void:	
	var parent : ProjectileProvider = get_parent()
	projectile_damage = parent.get_projectile_data().damage

	var game_root : Node2D = get_tree().root.get_node_or_null("Root")
	var map_node = game_root.get_node_or_null("Map")
	tilemap = map_node.get_node_or_null(TILEMAP_LAYER_NAME)
	
	assert(not map_node == null, "Projectile collision handler could not find map root!")
	assert(not game_root == null, "Projectile collision handler could not find game root!")
	assert(not tilemap == null, "Projectile collision handler could not find tilemap!")	

func get_all_tiles_in_area() -> Array[Vector2i]:
	var overlapping_tiles: Array[Vector2i] = []
	# --- 1. Get the circle shape from the Area2D ---
	var shape_node : CollisionShape2D = explosion_area.get_child(0)
	assert(shape_node == null or shape_node.shape == null, "No CollisionShape2D found on Area2D")

	var shape : CircleShape2D = shape_node.shape
	var radius := shape.radius
	
	# --- 2. Compute a bounding box around the circle ---
	var top_left = self.global_position - Vector2(radius, radius)
	var bottom_right = self.global_position + Vector2(radius, radius)

	# --- 3. Convert to tile coordinates ---
	var start := tilemap.local_to_map(tilemap.to_local(top_left))
	var end := tilemap.local_to_map(tilemap.to_local(bottom_right))

	# --- 4. Loop through all tiles within that box ---
	for x in range(start.x, end.x + 1):
		for y in range(start.y, end.y + 1):
			var cell_pos := Vector2i(x, y)
			var tile_id = tilemap.get_cell_source_id(cell_pos)
			if tile_id == -1:
				continue

			# --- 5. Check if tile center is inside the circle ---
			var tile_world_pos = tilemap.to_global(tilemap.map_to_local(cell_pos))
			var distance = self.global_position.distance_to(tile_world_pos)
			if distance <= radius:
				overlapping_tiles.append(cell_pos)
				
	return overlapping_tiles


func _on_explosion_area_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		var tilemap_layer : TileMapLayer = body
		print("Valid hit on:", tilemap_layer.name)
	else:
		print("Ignoring:", body.name)
