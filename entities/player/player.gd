extends Node2D
var direction:int =0
var speed:int =300
var halfsizeship=16
var bullet= preload("res://entities/bullet/bullet.tscn")
var bullet_speed:=0.700
var bullet_counter=0

func _ready():
	pass



func _process(delta: float):
	bullet_counter=bullet_counter+delta
	if Input.is_action_just_pressed("shoot") and bullet_counter>=bullet_speed:             
		bullet_counter=0
		var bullet_instance=bullet.instantiate()
		bullet_instance.position.x=position.x
		bullet_instance.position.y=position.y-20
		get_parent().get_node("Bullets").add_child(bullet_instance)
	if Input.is_action_pressed("move_left"):
		direction=-1
	elif Input.is_action_pressed("move_right"):
		direction=1
	else:
		direction=0
	position.x=clamp(position.x+speed*direction*delta,halfsizeship,400-halfsizeship)
	
