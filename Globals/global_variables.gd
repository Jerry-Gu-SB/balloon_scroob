extends Node

enum CollisionLayers { 
	Terrain = 1 << 0, 
	Hazards = 1 << 1, 
	Breakables = 1 << 2, 
	Player = 1 << 3,
}
