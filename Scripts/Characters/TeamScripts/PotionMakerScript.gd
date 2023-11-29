extends Spatial

func miss():
	$MissIndicator/MissAnimationPlayer.play("Miss")
	MusicHandler.get_node("MissSound").play()
	
func battleStart():
	get_parent().get_parent().get_parent().get_node("BattleTransition/AnimationPlayer").play("BattleEnter")
	get_parent().get_parent().get_parent().get_node("Camera/UIHolder/BrewingHolder/Cauldron").brewDoneBad()
	
func _on_BattleIndicatorAnimationPlayer_animation_finished(_anim_name):
	battleStart()
