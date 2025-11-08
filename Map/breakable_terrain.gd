extends TileMapLayer
class_name BreakableTerrain

func take_damage_on_tiles(list_of_tiles : Array[Vector2i], damage : float) -> void:
	for tile in list_of_tiles:
		print(tile)
		take_damage_on_tile(tile, damage)
		
func take_damage_on_tile(tile : Vector2i, damage : float) -> void:
	var tile_data : TileData = self.get_cell_tile_data(tile)
	assert(tile_data, "No tile to take damage from at: " + str(tile))
	
	var current_tile_health = tile_data.get_custom_data("health")
	print("hit tile health: " + str(current_tile_health))
	if current_tile_health - damage <= 0:
		destroy_tile(tile)
	else:
		tile_data.set_custom_data("health", current_tile_health - damage)
		print("tile data new health: " + str(tile_data.get_custom_data("health")))
		
func destroy_tile(tile : Vector2i):
	self.set_cell(tile, -1)
