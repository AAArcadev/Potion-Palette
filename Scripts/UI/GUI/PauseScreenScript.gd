extends ColorRect

var canPause=true

func _physics_process(_delta):
	if Input.is_action_just_pressed("EscapeButton") and get_parent().get_node("Camera/UIHolder/BrewingHolder/CookBook").bookOpen==false and canPause==true:
		$PauseAnimationPlayer.play("Enter")
		get_tree().paused=true

func _on_ContinueButton_pressed():
	$PauseAnimationPlayer.play("Exit")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_PauseAnimationPlayer_animation_finished(anim_name):
	if anim_name=="Exit":
		get_tree().paused=false

func _on_RetryButton_pressed():
	get_tree().change_scene("res://Scenes/MainScenes/StartScreen.tscn")

func _on_GameOverAnimationPlayer_animation_finished(_anim_name):
	get_tree().paused=true
