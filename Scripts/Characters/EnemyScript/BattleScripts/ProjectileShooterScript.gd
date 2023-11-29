extends Node2D

export var rotationSpeed=0.5
export var CanWork=false

func _physics_process(_delta):
	if CanWork==true:
		visible=true
	if CanWork==false:
		visible=false
	if get_parent().battleOn==true and CanWork==true:
		rotation_degrees+=rotationSpeed
	
func start():
	$Timer.start()

func _on_Timer_timeout():
	$ShootNode/ProjectileShooter/AnimationPlayer.play("ShootLeadUp")

func shoot():
	if get_parent().battleOn==true:
		$ShootNode.shoot()

func _ready():
	pass

