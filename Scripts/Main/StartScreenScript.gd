extends Node2D

var hasClicked=false

func _physics_process(_delta):
	if Input.is_action_just_pressed("SpaceBar") and hasClicked==false:
		hasClicked=!hasClicked
		$TransitionBox/AnimationPlayer.play("FadeIn")
		$Tween.interpolate_property($AudioStreamPlayer,"volume_db",$AudioStreamPlayer.volume_db,-80,0.4,Tween.TRANS_SINE)
		$Tween.start()
		MusicHandler.get_node("StartScreenSpaceSound").play()
		
func _on_AnimationPlayer_animation_finished(_anim_name):
	get_tree().change_scene("res://Scenes/MainScenes/StartingStory.tscn")
	
func _ready():
	hasClicked=false
