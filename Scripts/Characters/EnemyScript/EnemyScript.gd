extends Spatial

onready var healthBarUnder=$HealthBar/ViewportContainer/Viewport/Camera2D/HealthBarUnder
onready var healthBar=$HealthBar/ViewportContainer/Viewport/Camera2D/HealthBar
onready var tween=$HealthBar/ViewportContainer/Viewport/Tween

var health=220
export var maxHealth=220
export var attack=70

export var hitChance=20

var canPosion=false
var canFire=false
var canIce=false

var dead=false

var enemyAnimNum=0

var characterCount=[0,1,2,3,4]

func damage(damageNo):
	if dead==false:
		print(damageNo)
		health-=(damageNo)
		$AnimationPlayer.play("Hurt")
		get_parent().get_parent().get_parent().get_node("Camera").shake(0.2,3000,0.2)
		tween.interpolate_property(healthBarUnder,"value",healthBarUnder.value,health,0.4,Tween.TRANS_SINE)
		tween.start()
		$DamageFont/ViewportContainer/Viewport/Label.text=String(damageNo)
		$DamageFont/DamageNumAnimationPlayer.play("Damage")
		MusicHandler.get_node("CreatureHurt").play()
		healthBar.value=health
		if health<=0:
			$DieAnimationPlayer.play("Die")
			dead=true
			get_parent().get_parent().get_parent().get_node("Camera/UIHolder/BrewingHolder/Cauldron").brewDoneBad()

func attackAnim():
	if dead==false:
		$AnimationPlayer.play("Attack")
	
func attackFunc():
	var characterCountElement=characterCount[floor(rand_range(0,get_parent().get_parent().get_parent().teammatesAlive))]
	if floor(rand_range(0,20))<=hitChance:
		if characterCountElement==0:
			get_parent().get_parent().get_parent().switchTurn()
			get_parent().get_parent().get_node("TeamHolder/Knight").damage(floor(rand_range(attack-20,attack)))
			if floor(rand_range(0,20))<=12 and get_parent().get_parent().get_node("TeamHolder/Knight").fired==false and get_parent().get_parent().get_node("TeamHolder/Knight").stunned==false and get_parent().get_parent().get_node("TeamHolder/Knight").iced==false and get_parent().get_parent().get_node("TeamHolder/Knight").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Knight").stunned=true
			if floor(rand_range(0,20))<=12 and canFire==true and get_parent().get_parent().get_node("TeamHolder/Knight").fired==false and get_parent().get_parent().get_node("TeamHolder/Knight").stunned==false and get_parent().get_parent().get_node("TeamHolder/Knight").iced==false and get_parent().get_parent().get_node("TeamHolder/Knight").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Knight").fired=true
				get_parent().get_parent().get_node("TeamHolder/Knight/DebuffTimer").start()
			if floor(rand_range(0,20))<=12 and canIce==true and get_parent().get_parent().get_node("TeamHolder/Knight").fired==false and get_parent().get_parent().get_node("TeamHolder/Knight").stunned==false and get_parent().get_parent().get_node("TeamHolder/Knight").iced==false and get_parent().get_parent().get_node("TeamHolder/Knight").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Knight").iced=true
				get_parent().get_parent().get_node("TeamHolder/Knight/DebuffTimer").start()
			if floor(rand_range(0,20))<=12 and canPosion==true and get_parent().get_parent().get_node("TeamHolder/Knight").fired==false and get_parent().get_parent().get_node("TeamHolder/Knight").stunned==false and get_parent().get_parent().get_node("TeamHolder/Knight").iced==false and get_parent().get_parent().get_node("TeamHolder/Knight").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Knight").posioned=true
				get_parent().get_parent().get_node("TeamHolder/Knight/DebuffTimer").start()

		if characterCountElement==1:
			get_parent().get_parent().get_parent().switchTurn()
			get_parent().get_parent().get_node("TeamHolder/Tank").damage(floor(rand_range(attack-20,attack)))
			if floor(rand_range(0,20))<=12 and get_parent().get_parent().get_node("TeamHolder/Tank").fired==false and get_parent().get_parent().get_node("TeamHolder/Tank").stunned==false and get_parent().get_parent().get_node("TeamHolder/Tank").iced==false and get_parent().get_parent().get_node("TeamHolder/Tank").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Tank").stunned=true
			if floor(rand_range(0,20))<=12 and canFire==true and get_parent().get_parent().get_node("TeamHolder/Tank").fired==false and get_parent().get_parent().get_node("TeamHolder/Tank").stunned==false and get_parent().get_parent().get_node("TeamHolder/Tank").iced==false and get_parent().get_parent().get_node("TeamHolder/Tank").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Tank").fired=true
				get_parent().get_parent().get_node("TeamHolder/Tank/DebuffTimer").start()
			if floor(rand_range(0,20))<=12 and canIce==true and get_parent().get_parent().get_node("TeamHolder/Tank").fired==false and get_parent().get_parent().get_node("TeamHolder/Tank").stunned==false and get_parent().get_parent().get_node("TeamHolder/Tank").iced==false and get_parent().get_parent().get_node("TeamHolder/Tank").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Tank").iced=true
				get_parent().get_parent().get_node("TeamHolder/Tank/DebuffTimer").start()
			if floor(rand_range(0,20))<=12 and canPosion==true and get_parent().get_parent().get_node("TeamHolder/Tank").fired==false and get_parent().get_parent().get_node("TeamHolder/Tank").stunned==false and get_parent().get_parent().get_node("TeamHolder/Tank").iced==false and get_parent().get_parent().get_node("TeamHolder/Tank").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Tank").posioned=true
				get_parent().get_parent().get_node("TeamHolder/Tank/DebuffTimer").start()
				
		if characterCountElement==2:
			get_parent().get_parent().get_parent().switchTurn()
			get_parent().get_parent().get_node("TeamHolder/Archer").damage(floor(rand_range(attack-20,attack)))
			if floor(rand_range(0,20))<=10 and get_parent().get_parent().get_node("TeamHolder/Archer").fired==false and get_parent().get_parent().get_node("TeamHolder/Archer").stunned==false and get_parent().get_parent().get_node("TeamHolder/Archer").iced==false and get_parent().get_parent().get_node("TeamHolder/Archer").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Archer").stunned=true
			if floor(rand_range(0,20))<=10 and canFire==true and get_parent().get_parent().get_node("TeamHolder/Archer").fired==false and get_parent().get_parent().get_node("TeamHolder/Archer").stunned==false and get_parent().get_parent().get_node("TeamHolder/Archer").iced==false and get_parent().get_parent().get_node("TeamHolder/Archer").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Archer").fired=true
				get_parent().get_parent().get_node("TeamHolder/Archer/DebuffTimer").start()
			if floor(rand_range(0,20))<=10 and canIce==true and get_parent().get_parent().get_node("TeamHolder/Archer").fired==false and get_parent().get_parent().get_node("TeamHolder/Archer").stunned==false and get_parent().get_parent().get_node("TeamHolder/Archer").iced==false and get_parent().get_parent().get_node("TeamHolder/Archer").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Archer").iced=true
				get_parent().get_parent().get_node("TeamHolder/Archer/DebuffTimer").start()
			if floor(rand_range(0,20))<=10 and canPosion==true and get_parent().get_parent().get_node("TeamHolder/Archer").fired==false and get_parent().get_parent().get_node("TeamHolder/Archer").stunned==false and get_parent().get_parent().get_node("TeamHolder/Archer").iced==false and get_parent().get_parent().get_node("TeamHolder/Archer").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Archer").posioned=true
				get_parent().get_parent().get_node("TeamHolder/Archer/DebuffTimer").start()
				
		if characterCountElement==3:
			get_parent().get_parent().get_parent().switchTurn()
			get_parent().get_parent().get_node("TeamHolder/Wizard").damage(floor(rand_range(attack-20,attack)))
			if floor(rand_range(0,20))<=10 and get_parent().get_parent().get_node("TeamHolder/Wizard").fired==false and get_parent().get_parent().get_node("TeamHolder/Wizard").stunned==false and get_parent().get_parent().get_node("TeamHolder/Wizard").iced==false and get_parent().get_parent().get_node("TeamHolder/Wizard").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Wizard").stunned=true
			if floor(rand_range(0,20))<=10 and canFire==true and get_parent().get_parent().get_node("TeamHolder/Wizard").fired==false and get_parent().get_parent().get_node("TeamHolder/Wizard").stunned==false and get_parent().get_parent().get_node("TeamHolder/Wizard").iced==false and get_parent().get_parent().get_node("TeamHolder/Wizard").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Wizard").fired=true
				get_parent().get_parent().get_node("TeamHolder/Wizard/DebuffTimer").start()
			if floor(rand_range(0,20))<=10 and canIce==true and get_parent().get_parent().get_node("TeamHolder/Wizard").fired==false and get_parent().get_parent().get_node("TeamHolder/Wizard").stunned==false and get_parent().get_parent().get_node("TeamHolder/Wizard").iced==false and get_parent().get_parent().get_node("TeamHolder/Wizard").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Wizard").iced=true
				get_parent().get_parent().get_node("TeamHolder/Wizard/DebuffTimer").start()
			if floor(rand_range(0,20))<=10 and canPosion==true and get_parent().get_parent().get_node("TeamHolder/Wizard").fired==false and get_parent().get_parent().get_node("TeamHolder/Wizard").stunned==false and get_parent().get_parent().get_node("TeamHolder/Wizard").iced==false and get_parent().get_parent().get_node("TeamHolder/Wizard").posioned==false:
				get_parent().get_parent().get_node("TeamHolder/Wizard").posioned=true
				get_parent().get_parent().get_node("TeamHolder/Wizard/DebuffTimer").start()
		
		if characterCountElement==4:
			MusicHandler.get_node("IndicateSound").play()
			get_parent().get_parent().get_node("TeamHolder/PotionMaker/BattleIndicator/BattleIndicatorAnimationPlayer").play("BattleIndicate")
	else:
		get_parent().get_parent().get_node("TeamHolder/Knight").miss()
		get_parent().get_parent().get_node("TeamHolder/Tank").miss()
		get_parent().get_parent().get_node("TeamHolder/Archer").miss()
		get_parent().get_parent().get_node("TeamHolder/Wizard").miss()
		get_parent().get_parent().get_node("TeamHolder/PotionMaker").miss()
			
			
	$TurnArrow.visible=false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Attack":
		attackFunc()

func miss():
	$MissIndicator/MissAnimationPlayer.play("Miss")
	MusicHandler.get_node("MissSound").play()

func _on_MissAnimationPlayer_animation_finished(_anim_name):
	get_parent().get_parent().get_parent().switchTurn()
	
func _ready():
	reset()
	$AnimatedSprite3D.animation=String(enemyAnimNum)
	
func reset():
	health=maxHealth

func _physics_process(_delta):
	healthBar.max_value=maxHealth
	healthBarUnder.max_value=maxHealth
	if health>maxHealth:
		health=maxHealth
		
	if $AnimatedSprite3D.animation=="0":
		canPosion=false
		canFire=false
		canIce=false
	if $AnimatedSprite3D.animation=="1":
		canPosion=false
		canFire=true
		canIce=false
	if $AnimatedSprite3D.animation=="2":
		canPosion=false
		canFire=false
		canIce=true
	if $AnimatedSprite3D.animation=="3":
		canPosion=true
		canFire=false
		canIce=false
	if $AnimatedSprite3D.animation=="4":
		canPosion=false
		canFire=false
		canIce=true
	if $AnimatedSprite3D.animation=="5":
		canPosion=false
		canFire=true
		canIce=true
	if $AnimatedSprite3D.animation=="6":
		canPosion=false
		canFire=true
		canIce=true
		
func _on_DieAnimationPlayer_animation_finished(_anim_name):
	get_parent().get_parent().get_parent().get_node("Camera/UIHolder/BrewingHolder/Cauldron").brewDoneBad()
	if enemyAnimNum<6:
		get_parent().get_parent().get_parent().get_node("ChangeFloorAnimationPlayer").play("Change")
		get_tree().paused=true
		get_parent().get_parent().get_parent().get_node("PauseScreen").canPause=false
		get_parent().get_parent().get_parent().get_node("ChangeSceneCover/FinishLabel").text="FLOOR "+String(get_parent().get_parent().get_parent().level)+" OVERCOME!"
		enemyAnimNum+=1
		$AnimatedSprite3D.animation=String(enemyAnimNum)
		maxHealth+=20
		health=maxHealth
		healthBar.value=health
	if enemyAnimNum==6:
		get_parent().get_parent().get_parent().get_node("TransitionBox/TransitionAnimationPlayer").play("FadeInEnd")


func _on_TransitionAnimationPlayer_animation_finished(anim_name):
	if anim_name=="FadeInEnd":
		get_tree().change_scene("res://Scenes/MainScenes/EndScene.tscn")
