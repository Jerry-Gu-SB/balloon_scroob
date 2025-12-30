extends Node

enum CollisionLayers { 
	Terrain = 1 << 0, 
	Hazards = 1 << 1, 
	Breakables = 1 << 2, 
	Player = 1 << 3,
}

var LastCheckpoint : Vector2 = Vector2(0, 0)
