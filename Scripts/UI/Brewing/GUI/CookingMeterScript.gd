extends ColorRect

export var speed=20
export var moving=false

var overArea=false

var countNumber=0
var maxCountNumber=1
var badCountNumber=0

func _physics_process(_delta):
	if moving==true:
		$MoveBar.rect_position.x +=speed 
		$RightPressIcon.animation=String(countNumber)
		$WrongPressIcon.animation=String(badCountNumber)
		if Input.is_action_just_pressed("SpaceBar") and overArea==true:
			speed=speed*1.05
			countNumber+=1
			get_parent().get_node("Cauldron/AnimationPlayer").playback_speed+=0.2
			$EnterArea.rect_position.x=rand_range(3,316)
			#print("hit")
			MusicHandler.get_node("BrewCorrectSound").play()
			if countNumber==maxCountNumber:
				get_parent().get_node("Cauldron").brewDone()
				countNumber=0
				moving=false
				visible=false
				get_parent().get_node("Cauldron/AnimationPlayer").playback_speed=1
				speed=-5
				badCountNumber=0
				maxCountNumber=1
				$MoveBar.rect_position.x=175
				
		if Input.is_action_just_pressed("SpaceBar") and overArea==false:
			badCountNumber+=1
			get_parent().get_node("Cauldron/AnimationPlayer").playback_speed-=0.2
			#print("hitN0")
			MusicHandler.get_node("ErrorSound").play()
			if badCountNumber==3:
				get_parent().get_node("Cauldron").brewDoneBad()
				
				
		
func _on_Area2D_body_entered(body):
	if body.get_name()=="CollisionArea":
		speed=speed*-1
	
func _on_Area2D_area_entered(area):
	if area.get_name()=="EnterArea2D":
		overArea=true
		$MoveBar.rect_scale.x=1.3
		$MoveBar.rect_scale.y=1.3

func _on_Area2D_area_exited(area):
	if area.get_name()=="EnterArea2D":
		overArea=false
		$MoveBar.rect_scale.x=1
		$MoveBar.rect_scale.y=1

func brew(maxCount):
	maxCountNumber=maxCount
	countNumber=0
	moving=true
	visible=true
