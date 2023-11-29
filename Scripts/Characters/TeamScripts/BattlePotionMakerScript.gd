extends KinematicBody2D

export var movespeed = 200
export var Health=7

export var invincible=false

onready var battleHealthBar= get_parent().get_parent().get_node("BattleHealthBar")

func _physics_process(_delta):
	var motion = Vector2()
	
	battleHealthBar.animation=String(Health)
	if get_parent().visible==true:
		if Input. is_action_pressed("ui_up"):
			motion.y-=10
			$AnimatedSprite.play("Move")

		if Input. is_action_pressed("ui_down"):
			motion.y+=10
			$AnimatedSprite.play("Move")

		if Input. is_action_pressed("ui_right"):
			motion.x+=10
			$AnimatedSprite.flip_h=false
			$AnimatedSprite.play("Move")

			
		if Input. is_action_pressed("ui_left"):
			motion.x-=10
			$AnimatedSprite.flip_h=true
			$AnimatedSprite.play("Move")

		motion = motion.normalized()
		motion = move_and_slide(motion*movespeed)
		
		if not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_right")  and not Input.is_action_pressed("ui_left"):
				$AnimatedSprite.play("Idle")
			
	
	
func Damaged(damageNo):
	if invincible==false and get_parent().visible==true:
		$FlashAnimationPlayer.play("Flash")
		Health-=damageNo
		invincible=true
		get_parent().get_parent().get_parent().get_node("Camera").shake(0.2,3000,0.2)
		MusicHandler.get_node("PotionMakerHitSound").play()
		if Health<=0:
			invincible=true
			Health=1
			get_parent().battleOn=false
			get_parent().get_parent().get_parent().get_node("GameoverScreen/GameOverAnimationPlayer").play("Enter")
			
func _on_FlashAnimationPlayer_animation_finished(_anim_name):
	invincible=false
