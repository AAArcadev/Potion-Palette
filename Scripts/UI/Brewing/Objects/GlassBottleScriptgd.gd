extends Node2D

var canClick=false

export var yellow=false
export var blue=false
export var red=false

func _physics_process(_delta):
	if Input.is_action_just_pressed("LeftMouseButton") and canClick==true:
		$AnimationPlayer.play("Pour")
		MusicHandler.get_node("PotionPickSound").play()
		if red==true:
			get_parent().get_node("Cauldron").addColor("red")
		if yellow==true:
			get_parent().get_node("Cauldron").addColor("yellow")
		if blue==true:
			get_parent().get_node("Cauldron").addColor("blue")
			
	if yellow==true:
		$GlassBottleLiquid.modulate=Color(0.93,214,0)
	if blue==true:
		$GlassBottleLiquid.modulate=Color(0.04,0.36,0.62)
	if red==true:
		$GlassBottleLiquid.modulate=Color(0.88,0.13,0.18)


func _on_Area2D_mouse_entered():
	canClick=true
	scale.x=9
	scale.y=9

func _on_Area2D_mouse_exited():
	canClick=false
	scale.x=8
	scale.y=8
