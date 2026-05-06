class_name bots
extends Area2D
var enemy_speed=120
func _ready():
	add_to_group("enemy")
	randomize()
	position=Vector2(randf_range(0,400),0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.y+=enemy_speed*delta


func _on_area_entered(area: Area2D):
	if area.name=="BulletArea":
		area.get_parent().queue_free()
		queue_free()

	
