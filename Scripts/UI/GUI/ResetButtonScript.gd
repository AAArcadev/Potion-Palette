extends Sprite

var canClick=false

func _physics_process(_delta):
	if Input.is_action_just_pressed("LeftMouseButton") and canClick==true and get_parent().brewing==false:
		get_parent().color="white"
		MusicHandler.get_node("BrewButtonSound").play()
	
func _on_Area2D_mouse_entered():
	canClick=true
	scale.x=1.2
	scale.y=1.2
	
func _on_Area2D_mouse_exited():
	canClick=false
	scale.x=1
	scale.y=1
