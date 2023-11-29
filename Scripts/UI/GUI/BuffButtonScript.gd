extends Node2D

export var HealthButton=false
export var AttackButton=false
export var DefenceButton=false

var canClick=false
var hasPicked=false

func _physics_process(_delta):
	if HealthButton==true:
		$NinePatchRect/Sprite.frame=2
	if AttackButton==true:
		$NinePatchRect/Sprite.frame=1
	if DefenceButton==true:
		$NinePatchRect/Sprite.frame=0
	if Input.is_action_just_pressed("LeftMouseButton") and canClick==true and hasPicked==false:
		hasPicked=!hasPicked
		get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy/AnimatedSprite3D").opacity=1
		get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy/HealthBar").opacity=1
		get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").dead=false
		MusicHandler.get_node("PowerUpSound").play()
		get_parent().get_parent().level+=1
		get_parent().get_node("AnimationPlayer").play("Exit")
		get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").attack+=10
		get_parent().get_parent().resetStage()
		if HealthButton==true:
			if get_parent().get_parent().get_node("Characters/TeamHolder/Knight").dead==false:
				get_parent().get_parent().get_node("Characters/TeamHolder/Knight").health+=20
			if get_parent().get_parent().get_node("Characters/TeamHolder/Tank").dead==false:
				get_parent().get_parent().get_node("Characters/TeamHolder/Tank").health+=20
			if get_parent().get_parent().get_node("Characters/TeamHolder/Archer").dead==false:
				get_parent().get_parent().get_node("Characters/TeamHolder/Archer").health+=20
			if get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").dead==false:
				get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").health+=20
			get_parent().get_parent().get_node("Characters/TeamHolder/Knight").maxHealth+=20
			get_parent().get_parent().get_node("Characters/TeamHolder/Tank").maxHealth+=20
			get_parent().get_parent().get_node("Characters/TeamHolder/Archer").maxHealth+=20
			get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").maxHealth+=20
		if AttackButton==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Knight").attackUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Tank").attackUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Archer").attackUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").attackUp+=5
		if DefenceButton==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Knight").defenceUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Tank").defenceUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Archer").defenceUp+=5
			get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").defenceUp+=5

func _on_Area2D_mouse_entered():
	scale.x=4.2
	scale.y=4.2
	canClick=true

func _on_Area2D_mouse_exited():
	scale.x=4
	scale.y=4
	canClick=false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Enter":
		get_tree().paused=true
		hasPicked=false
	if anim_name=="Exit":
		get_parent().get_parent().get_node("ChangeFloorAnimationPlayer").play("ChangeReverse")
		get_parent().get_parent().resetStage()
