extends Node2D

func _physics_process(_delta):
	if GlobalVariableHolderScript.knightDead==true:
		$EndHolder/TeamMateBack3.visible=false
	if GlobalVariableHolderScript.TankDead==true:
		$EndHolder/TeamMateBack.visible=false
	if GlobalVariableHolderScript.ArcherDead==true:
		$EndHolder/TeamMateBack4.visible=false
	if GlobalVariableHolderScript.WizardDead==true:
		$EndHolder/TeamMateBack2.visible=false


func _on_TransitionAnimationPlayer_animation_finished(_anim_name):
	$CutsceneAnimationPlayer.play("Cutscene")

