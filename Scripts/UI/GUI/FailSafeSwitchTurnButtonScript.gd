extends Area2D

var canClick=false

func _physics_process(_delta):
	if Input.is_action_just_pressed("LeftMouseButton") and canClick==true:
		get_parent().switchTurn()
		
func _on_FailSafeSwitchTurnButton_mouse_entered():
	canClick=true
	scale.x=2.2
	scale.y=2.2

func _on_FailSafeSwitchTurnButton_mouse_exited():
	canClick=false
	scale.x=2
	scale.y=2
