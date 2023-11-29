extends Node2D

var timerTime=30
var battleOn=false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="BattleExit":
		get_parent().get_parent().switchTurn()
		$ProjectileShooter.CanWork=false
		$ProjectileShooter2.CanWork=false
		$ProjectileShooter3.CanWork=false
		$ProjectileShooter4.CanWork=false
		
		if get_parent().get_parent().get_node("Characters/TeamHolder/Knight").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Knight").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Knight").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Knight/DebuffTimer").paused=false
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Tank").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Tank").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Tank").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Tank/DebuffTimer").paused=false
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Archer").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Archer").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Archer").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Archer/DebuffTimer").paused=false
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/DebuffTimer").paused=false
	if anim_name=="BattleEnter":
		get_parent().get_node("CountDownLabel/CountDownAnimationPlayer").play("CountDown")
		timerTime=30
		$BattlePotionMaker.Health=7
		$BattlePotionMaker.invincible=false
		if get_parent().get_parent().get_node("Characters/TeamHolder/Knight").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Knight").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Knight").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Knight/DebuffTimer").paused=true
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Tank").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Tank").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Tank").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Tank/DebuffTimer").paused=true
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Archer").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Archer").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Archer").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Archer/DebuffTimer").paused=true
			
		if get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").posioned==true or get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").iced==true or get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").fired==true:
			get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/DebuffTimer").paused=true
			
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==0:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=1
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=1
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==1:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=0.8
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=0.8
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==2:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=0.8
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=0.8
			$ProjectileShooter3.CanWork=true
			$ProjectileShooter3/Timer.wait_time=0.8
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==3:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=0.8
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=0.8
			$ProjectileShooter3.CanWork=true
			$ProjectileShooter3/Timer.wait_time=0.8
			$ProjectileShooter4.CanWork=true
			$ProjectileShooter4/Timer.wait_time=0.8
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==4:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=1.3
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=1.3
			$ProjectileShooter3.CanWork=true
			$ProjectileShooter3/Timer.wait_time=1.3
			$ProjectileShooter4.CanWork=true
			$ProjectileShooter4/Timer.wait_time=1.3
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==5:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=1
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=1
			$ProjectileShooter3.CanWork=true
			$ProjectileShooter3/Timer.wait_time=1
			$ProjectileShooter4.CanWork=true
			$ProjectileShooter4/Timer.wait_time=1
		if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==6:
			$ProjectileShooter.CanWork=true
			$ProjectileShooter/Timer.wait_time=1
			$ProjectileShooter2.CanWork=true
			$ProjectileShooter2/Timer.wait_time=1
			$ProjectileShooter3.CanWork=true
			$ProjectileShooter3/Timer.wait_time=1
			$ProjectileShooter4.CanWork=true
			$ProjectileShooter4/Timer.wait_time=1


func _on_Timer_timeout():
	if timerTime>0:
		timerTime-=1
		get_parent().get_node("TimerLabel").text=String(timerTime)
		get_parent().get_node("TimerLabel/Timer").start()
	if timerTime<=0:
		get_parent().get_parent().get_node("BattleTransition/AnimationPlayer").play("BattleExit")
		get_parent().get_node("TimerLabel/Timer").stop()
		$BattlePotionMaker.invincible=true
		$ProjectileShooter/Timer.stop()
		$ProjectileShooter2/Timer.stop()
		$ProjectileShooter3/Timer.stop()
		$ProjectileShooter4/Timer.stop()
		battleOn=false
		MusicHandler.get_node("ProjectileHitSound").stop()

func _on_CountDownAnimationPlayer_animation_finished(_anim_name):
	battleOn=true
	get_parent().get_node("TimerLabel/Timer").start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==0:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==1:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==2:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
			$ProjectileShooter3.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==3:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
			$ProjectileShooter3.start()
			$ProjectileShooter4.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==4:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
			$ProjectileShooter3.start()
			$ProjectileShooter4.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==5:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
			$ProjectileShooter3.start()
			$ProjectileShooter4.start()
	if get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==6:
			$ProjectileShooter.start()
			$ProjectileShooter2.start()
			$ProjectileShooter3.start()
			$ProjectileShooter4.start()
