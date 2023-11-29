extends Spatial

onready var tween=get_parent().get_parent().get_parent().get_node("Camera/UIHolder/HealthHolder/TankHealthHolder/Tween")
onready var healthBar=get_parent().get_parent().get_parent().get_node("Camera/UIHolder/HealthHolder/TankHealthHolder/Health")
onready var healthBarUnder=get_parent().get_parent().get_parent().get_node("Camera/UIHolder/HealthHolder/TankHealthHolder/HealthUnder")


var health=250
export var maxHealth=250
export var attack=25
export var defence=25

export var hitChance=0

#status variables
var dead=false
var posioned=false
var stunned=false
var fired=false
var iced=false
var attackUp=0
var attackIsUp=false
var defenceUp=0
var defenceIsUp=false

func _ready():
	healthBar.max_value=maxHealth
	healthBar.value=health
	healthBarUnder.max_value=maxHealth
	healthBarUnder.value=health
	
func heal(healNo):
	if dead!=true:
		health+=(healNo)
		healthBar.value=health
		$DamageFont/ViewportContainer/Viewport/Label.text=String(healNo)
		$DamageFont/ViewportContainer/Viewport/Label.modulate=Color(0.05,0.53,0.26)
		$DamageFont/DamageNumAnimationPlayer.play("Damage")
		
func damage(damageNo):
	if dead!=true:
		get_parent().get_parent().get_parent().get_node("Camera").shake(0.2,3000,0.2)
		var totalDefence=defence+defenceUp
		healthBar.value=health
		health-=(damageNo-totalDefence)
		$AnimationPlayer.play("Hurt")
		tween.interpolate_property(healthBarUnder,"value",healthBarUnder.value,health,0.4,Tween.TRANS_SINE)
		tween.start()
		MusicHandler.get_node("TankHitSound").play()
		$DamageFont/ViewportContainer/Viewport/Label.modulate=Color(0.88,0.13,0.18)
		$DamageFont/ViewportContainer/Viewport/Label.text=String(damageNo)
		$DamageFont/DamageNumAnimationPlayer.play("Damage")
		if health<=0:
			dead=true
			health=0
			get_parent().get_parent().get_parent().teammatesAlive-=1
			get_parent().get_parent().get_node("EnemyHolder/Enemy").characterCount.remove(1)

func attackAnim():
	if stunned==false and dead==false and iced==false:
		$AnimationPlayer.play("Attack")
		$TurnArrow.visible=false
	if dead==true or stunned==true or iced==true:
		get_parent().get_parent().get_parent().switchTurn()
	
func attackFunc():
	if stunned==false or dead==false and get_parent().get_parent().get_node("EnemyHolder/Enemy").dead==false:
		if floor(rand_range(0,20))<hitChance:
			var totalAttack=attack+attackUp
			get_parent().get_parent().get_node("EnemyHolder/Enemy").damage(floor(rand_range(totalAttack-10,totalAttack)))
			get_parent().get_parent().get_parent().switchTurn()
		else:
			get_parent().get_parent().get_node("EnemyHolder/Enemy").miss()
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Attack":
		attackFunc()
		
func miss():
	$MissIndicator/MissAnimationPlayer.play("Miss")
	MusicHandler.get_node("MissSound").play()

func _on_MissAnimationPlayer_animation_finished(_anim_name):
	get_parent().get_parent().get_parent().switchTurn()

func _physics_process(_delta):
	healthBar.max_value=maxHealth
	healthBar.value=health
	healthBarUnder.max_value=maxHealth
	healthBarUnder.value=health
	if dead==false:
		$AnimatedSprite3D.play("default")
	if dead==true:
		$AnimatedSprite3D.play("Dead")
		$AnimatedSprite3D.modulate=Color(1,1,1)
		posioned=false
		fired=false
		stunned=false
		iced=false
		GlobalVariableHolderScript.TankDead=true

	if health>maxHealth:
		health=maxHealth

	if posioned==true:
		$AnimatedSprite3D.modulate=Color(0.53,0.13,0.37)
		fired=false
		stunned=false
		iced=false
	if stunned==true:
		$AnimatedSprite3D.modulate=Color(0.93,0.84,0)
		fired=false
		posioned=false
		iced=false
		$AnimatedSprite3D.playing=false
	if stunned==false:
		$AnimatedSprite3D.playing=true
		
	if fired==true:
		$AnimatedSprite3D.modulate=Color(0.9,0.45,0.09)
		$FireCPUParticles.emitting=true
		iced=false
		stunned=false
		iced=false
	if fired==false:
		$FireCPUParticles.emitting=false
		
	if iced==true:
		$AnimatedSprite3D.modulate=Color(0.63,0.77,0.78)
		$IceCPUParticles.emitting=true
		fired=false
		stunned=false
		posioned=false
		$AnimatedSprite3D.playing=false
	if iced==false:
		$IceCPUParticles.emitting=false
		$AnimatedSprite3D.playing=true
		
	if attackIsUp==true:
		$AttackBuffParticles.emitting=true
	if attackIsUp==false:
		$AttackBuffParticles.emitting=false
		
	if defenceIsUp==true:
		$DefenceBuffParticles.emitting=true
	if defenceIsUp==false:
		$DefenceBuffParticles.emitting=false
		
	if iced==false and fired==false and posioned==false and stunned==false:
		$AnimatedSprite3D.modulate=Color(1,1,1)

func debuffDamage(damageNo):
	if dead!=true:
		get_parent().get_parent().get_parent().get_node("Camera").shake(0.2,3000,0.2)
		var totalDefence=defence+defenceUp
		healthBar.value=health
		health-=(damageNo-totalDefence)
		$AnimationPlayer.play("Hurt")
		tween.interpolate_property(healthBarUnder,"value",healthBarUnder.value,health,0.4,Tween.TRANS_SINE)
		tween.start()
		MusicHandler.get_node("TankHitSound").play()
		$DebuffDamageFont/ViewportContainer/Viewport/Label.text=String(damageNo)
		$DebuffDamageFont/DamageNumAnimationPlayer.play("Damage")
		if health<=0:
			dead=true
			health=0
			get_parent().get_parent().get_parent().teammatesAlive-=1
			get_parent().get_parent().get_node("EnemyHolder/Enemy").characterCount.remove(1)

func _on_DebuffTimer_timeout():
	if posioned==true:
		debuffDamage(5)
		$DebuffDamageFont/ViewportContainer/Viewport/Label.modulate=Color(0.53,0.13,0.37)
	if fired==true:
		debuffDamage(10)
		$DebuffDamageFont/ViewportContainer/Viewport/Label.modulate=Color(0.9,0.45,0.09)
	if iced==true:
		debuffDamage(10)
		$DebuffDamageFont/ViewportContainer/Viewport/Label.modulate=Color(0.63,0.77,0.78)


func _on_BuffTimer_timeout():
	attackIsUp=false
	defenceIsUp=false
	$AttackBuffParticles.emitting=false
	$DefenceBuffParticles.emitting=false
	$BuffTimer.stop()
