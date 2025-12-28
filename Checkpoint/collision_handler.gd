extends Area2D

@onready var blue_flag_sprite : AnimatedSprite2D = $"../Blue_Flag_Sprite"
@onready var gold_flag_sprite : AnimatedSprite2D = $"../Gold_Flag_Sprite"
@onready var hit_vfx : AnimatedSprite2D = $"../Hit Vfx"

func _ready() -> void:
	blue_flag_sprite.play("default")
	gold_flag_sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		blue_flag_sprite.visible = false
		gold_flag_sprite.visible = true
		hit_vfx.play("default")
