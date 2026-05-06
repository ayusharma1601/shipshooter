extends Node
var enemy_instance=preload("res://entities/enemies/enemies.tscn")

func _ready():
	get_parent().get_node("Boundary").area_entered.connect(_the_end)
	var timer=Timer.new()
	add_child(timer)
	timer.wait_time=1.4
	timer.connect("timeout",_enemies_create)
	timer.start()
	

func _enemies_create():
	var enemies=enemy_instance.instantiate()
	get_parent().get_node("enemies").add_child(enemies)
	

func _the_end(area):
	if area.is_in_group("enemy"):
		get_tree().paused = true

		
