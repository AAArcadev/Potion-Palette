extends Node2D

func _physics_process(_delta):
	position.x=get_global_mouse_position().x
	position.y=get_global_mouse_position().y
