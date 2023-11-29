extends Node2D

var canClick=false
var bookOpen=false

func _physics_process(_delta):
	if Input.is_action_just_pressed("LeftMouseButton") and canClick==true and bookOpen==false:
		MusicHandler.get_node("BrewButtonSound").play()
		get_parent().get_parent().get_parent().get_parent().get_node("CookBookHolder").visible=true
		bookOpen=!bookOpen
		get_tree().paused=true
		

func _on_Area2D_mouse_entered():
	scale.x=8.2
	scale.y=8.2
	canClick=true

func _on_Area2D_mouse_exited():
	scale.x=8
	scale.y=8
	canClick=false


func _on_ExitButton_pressed():
	if bookOpen==true:
		MusicHandler.get_node("BrewButtonSound").play()
		bookOpen=!bookOpen
		get_tree().paused=false
		get_parent().get_parent().get_parent().get_parent().get_node("CookBookHolder").visible=false
