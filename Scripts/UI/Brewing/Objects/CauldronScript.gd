extends Node2D

var previousColor="white"
var color="white"
var brewing=false

var characterChoose=0
var canPickCharacter=false

func addColor(colorAdded):
	previousColor=color
	if colorAdded=="yellow":
		if color=="white":
			color="yellow"
		if color=="blue":
			color="green"
		if color=="red":
			color="orange"
		if color=="purple":
			color="brown"
			
	if colorAdded=="blue":
		if color=="white":
			color="blue"
		if color=="yellow":
			color="green"
		if color=="red":
			color="purple"
		if color=="orange":
			color="brown"
			
	if colorAdded=="red":
		if color=="white":
			color="red"
		if color=="blue":
			color="purple"
		if color=="yellow":
			color="orange"
		if color=="green":
			color="brown"
			
		

func tweenColor(_colorT,_previousColorT):
	pass
	
func _physics_process(_delta):
	if color=="white":
		$CauldronLiquid.modulate=Color(1,1,1)
		$BubbleParticle.modulate=Color(1,1,1)
	if color=="yellow":
		$CauldronLiquid.modulate=Color(0.93,214,0)
		$BubbleParticle.modulate=Color(0.93,214,0)
	if color=="blue":
		$CauldronLiquid.modulate=Color(0.04,0.36,0.62)
		$BubbleParticle.modulate=Color(0.04,0.36,0.62)
	if color=="red":
		$CauldronLiquid.modulate=Color(0.88,0.13,0.18)
		$BubbleParticle.modulate=Color(0.88,0.13,0.18)
	if color=="orange":
		$CauldronLiquid.modulate=Color(0.9,0.45,0.09)
		$BubbleParticle.modulate=Color(0.9,0.45,0.09)
	if color=="green":
		$CauldronLiquid.modulate=Color(0.05,0.53,0.26)
		$BubbleParticle.modulate=Color(0.05,0.53,0.26)
	if color=="purple":
		$CauldronLiquid.modulate=Color(0.53,0.13,0.37)
		$BubbleParticle.modulate=Color(0.53,0.13,0.37)
	if color=="brown":
		$CauldronLiquid.modulate=Color(0.53,0.23,0.13)
		$BubbleParticle.modulate=Color(0.53,0.23,0.13)
		
	if Input.is_action_just_pressed("ui_left") and canPickCharacter==true:
		MusicHandler.get_node("ChangeCharacterPickSound").play()
		characterChoose-=1
		if characterChoose==-1:
			characterChoose=3
		
	if Input.is_action_just_pressed("ui_right")and canPickCharacter==true:
		MusicHandler.get_node("ChangeCharacterPickSound").play()
		characterChoose+=1
		if characterChoose==4:
			characterChoose=0
		
	
	if canPickCharacter==true:
		if characterChoose==0:
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=true
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=false	
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=false	
		if characterChoose==1:
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=true
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=false	
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=false	
		if characterChoose==2:
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=true	
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=false	
		if characterChoose==3:
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=false	
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=true	
		
		if Input.is_action_just_pressed("SpaceBar") and characterChoose==0:
			canPickCharacter=!canPickCharacter
			MusicHandler.get_node("GivePotionSound").play()
			get_parent().get_node("PotionQuestionLabel").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=false
			if color=="red" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").attackUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").attackIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/BuffTimer").start()
			if color=="blue" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").defenceUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").defenceIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/BuffTimer").start()
			if color=="yellow":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").stunned=false
			if color=="orange":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").fired=false
			if color=="purple":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").posioned=false
			if color=="green":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").heal(int(rand_range(25,30)))
				print("heal")
			if color=="brown":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard").iced=false
				print("heal")
				
		if Input.is_action_just_pressed("SpaceBar") and characterChoose==1:
			canPickCharacter=!canPickCharacter
			MusicHandler.get_node("GivePotionSound").play()
			get_parent().get_node("PotionQuestionLabel").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=false
			if color=="red" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").attackUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").attackIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/BuffTimer").start()
			if color=="blue" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").defenceUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").defenceIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/BuffTimer").start()
			if color=="yellow":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").stunned=false
			if color=="orange":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").fired=false
			if color=="purple":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").posioned=false
			if color=="green":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").heal(int(rand_range(25,30)))
				print("heal")
			if color=="brown":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer").iced=false
					
		if Input.is_action_just_pressed("SpaceBar") and characterChoose==2:
			canPickCharacter=!canPickCharacter
			MusicHandler.get_node("GivePotionSound").play()
			get_parent().get_node("PotionQuestionLabel").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=false
			if color=="red" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").attackUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").attackIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/BuffTimer").start()
			if color=="blue" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").defenceUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").defenceIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/BuffTimer").start()
			if color=="yellow":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").stunned=false
			if color=="orange":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").fired=false
			if color=="purple":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").posioned=false
			if color=="green":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").heal(int(rand_range(25,30)))
				print("heal")
			if color=="brown":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank").iced=false
						
		if Input.is_action_just_pressed("SpaceBar") and characterChoose==3:
			canPickCharacter=!canPickCharacter
			MusicHandler.get_node("GivePotionSound").play()
			get_parent().get_node("PotionQuestionLabel").visible=false
			get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=false
			if color=="red" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").attackUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").attackIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/BuffTimer").start()
			if color=="blue" and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").attackIsUp==false and get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").defenceIsUp==false:
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").defenceUp+=5
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").defenceIsUp=true
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/BuffTimer").start()
			if color=="yellow":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").stunned=false
			if color=="orange":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").fired=false
			if color=="purple":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").posioned=false
			if color=="green":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").heal(int(rand_range(25,30)))
				print("heal")
			if color=="brown":
				get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight").iced=false
						
func _on_BrewButton_pressed():
	if color!="white" and brewing==false:
		MusicHandler.get_node("BrewButtonSound").play()
		$BubbleParticle.emitting=true
		$FireParticles2D.emitting=true
		$AnimationPlayer2.play("Brew")
		get_parent().get_node("CookingMeter").visible=true
		get_parent().get_node("CookingMeter").moving=true
		brewing=!brewing
		if color=="red":
			get_parent().get_node("CookingMeter").brew(7)
		if color=="blue":
			get_parent().get_node("CookingMeter").brew(7)
		if color=="yellow":
			get_parent().get_node("CookingMeter").brew(3)
		if color=="orange":
			get_parent().get_node("CookingMeter").brew(5)
		if color=="purple":
			get_parent().get_node("CookingMeter").brew(5)
		if color=="green":
			get_parent().get_node("CookingMeter").brew(3)
		if color=="brown":
			get_parent().get_node("CookingMeter").brew(5)

func brewDone():
	if brewing==true:
		$BubbleParticle.emitting=false
		$FireParticles2D.emitting=false
		$AnimationPlayer2.stop()
		get_parent().get_node("CookingMeter").visible=false
		get_parent().get_node("CookingMeter").moving=false
		get_parent().get_node("PotionQuestionLabel").visible=true
		canPickCharacter=true
		brewing=!brewing

func brewDoneBad():
	$BubbleParticle.emitting=false
	$FireParticles2D.emitting=false
	$AnimationPlayer2.stop()
	get_parent().get_node("CookingMeter").visible=false
	get_parent().get_node("CookingMeter").moving=false
	brewing=false
	get_parent().get_node("PotionQuestionLabel").visible=false
	color="white"
	canPickCharacter=false
	get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Wizard/TurnArrow").visible=false
	get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Archer/TurnArrow").visible=false
	get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Tank/TurnArrow").visible=false	
	get_parent().get_parent().get_parent().get_parent().get_node("Characters/TeamHolder/Knight/TurnArrow").visible=false	
	$AnimationPlayer.playback_speed=1
	get_parent().get_node("CookingMeter").badCountNumber=0
	get_parent().get_node("CookingMeter").speed=-5
	get_parent().get_node("CookingMeter").countNumber=0
	get_parent().get_node("CookingMeter/MoveBar").rect_position.x=175
