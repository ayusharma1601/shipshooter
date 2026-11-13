class_name bots
extends Area2D

@export var enemy_speed: float = 120.0

func _ready() -> void:
    add_to_group("enemy")
    randomize()
    position = Vector2(randf_range(0.0, 400.0), 0.0)

func _process(delta: float) -> void:
    position.y += enemy_speed * delta
    # Remove enemies after they leave the playfield instead of accumulating nodes.
    if position.y > 620.0:
        queue_free()

func _on_area_entered(area: Area2D) -> void:
    if area.name == "BulletArea":
        area.get_parent().queue_free()
        queue_free()
