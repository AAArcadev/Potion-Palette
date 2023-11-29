extends Spatial

var level=0
var characterTurn=-1

var teammatesAlive=5

var gameOverToggle=false


func switchTurn():
	characterTurn+=1
	if characterTurn==5:
		characterTurn=0
	$BattleTimer.start()
	#print(characterTurn)
	
	
func _on_BattleTimer_timeout():
	if characterTurn==0:
		$Characters/TeamHolder/Knight.attackAnim()
	if characterTurn==1:
		$Characters/TeamHolder/Tank.attackAnim()
	if characterTurn==2:
		$Characters/TeamHolder/Archer.attackAnim()
	if characterTurn==3:
		$Characters/TeamHolder/Wizard.attackAnim()
	if characterTurn>=4:
		$Characters/EnemyHolder/Enemy.attackAnim()
	$BattleTimer.stop()
	
func startBattle():
	switchTurn()
	

func _physics_process(_delta):
	$Camera/UIHolder/HealthHolder/FloorNumberLabel.text="FLOOR "+String(level)
	if teammatesAlive<=1 and gameOverToggle==false:
		$GameoverScreen/GameOverAnimationPlayer.play("Enter")

func resetStage():
		characterTurn=-1
		switchTurn()
		$PauseScreen.canPause=true
		$Characters/TeamHolder/Wizard.stunned=false
		$Characters/TeamHolder/Wizard.posioned=false
		$Characters/TeamHolder/Wizard.fired=false
		$Characters/TeamHolder/Wizard.iced=false
		$Characters/TeamHolder/Wizard.attackIsUp=false
		$Characters/TeamHolder/Wizard.defenceIsUp=false
		$Characters/TeamHolder/Tank.stunned=false
		$Characters/TeamHolder/Tank.posioned=false
		$Characters/TeamHolder/Tank.fired=false
		$Characters/TeamHolder/Tank.iced=false
		$Characters/TeamHolder/Tank.attackIsUp=false
		$Characters/TeamHolder/Tank.defenceIsUp=false
		$Characters/TeamHolder/Wizard.stunned=false
		$Characters/TeamHolder/Wizard.posioned=false
		$Characters/TeamHolder/Wizard.fired=false
		$Characters/TeamHolder/Wizard.iced=false
		$Characters/TeamHolder/Wizard.attackIsUp=false
		$Characters/TeamHolder/Wizard.defenceIsUp=false
		$Characters/TeamHolder/Archer.stunned=false
		$Characters/TeamHolder/Archer.posioned=false
		$Characters/TeamHolder/Archer.fired=false
		$Characters/TeamHolder/Archer.iced=false
		$Characters/TeamHolder/Archer.attackIsUp=false
		$Characters/TeamHolder/Archer.defenceIsUp=false
		if $Characters/TeamHolder/Knight.dead==false:
			$Characters/TeamHolder/Knight.health+=20
		if $Characters/TeamHolder/Tank.dead==false:
			$Characters/TeamHolder/Tank.health+=20
		if $Characters/TeamHolder/Archer.dead==false:
			$Characters/TeamHolder/Archer.health+=20
		if $Characters/TeamHolder/Wizard.dead==false:
			$Characters/TeamHolder/Wizard.health+=20

func _on_CountDownAnimationPlayer_animation_finished(_anim_name):
	startBattle()
	get_tree().paused=false
func _on_TransitionAnimationPlayer_animation_finished(_anim_name):
	$CountDownLabel/CountDownAnimationPlayer.play("CountDown")

func _on_ChangeFloorAnimationPlayer_animation_finished(anim_name):
	if anim_name=="Change":
		$ChangeSceneCover/AnimationPlayer.play("Enter")
	if anim_name=="ChangeReverse":
		$CountDownLabel/CountDownAnimationPlayer.play("CountDown")
		resetStage()
