extends Position2D

export (PackedScene) var Bullet
export var lookingAtPlayer=false

func shoot():
	var b = Bullet.instance()
	get_parent().get_parent().get_parent().add_child(b)
	b.global_transform= global_transform
	MusicHandler.get_node("ShooterShootSound").play()
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==0:
		b.modulate=Color(0.93,214,0)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==1:
		b.modulate=Color(0.9,0.45,0.09)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==2:
		b.modulate=Color(0.63,0.77,0.78)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==3:
		b.modulate=Color(0.53,0.13,0.37)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==4:
		b.modulate=Color(0.63,0.77,0.78)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==5:
		b.modulate=Color(1,1,1)
	if get_parent().get_parent().get_parent().get_parent().get_node("Characters/EnemyHolder/Enemy").enemyAnimNum==6:
		b.modulate=Color(0.69,0.45,0.6)

func _physics_process(_delta):
	if lookingAtPlayer==true:
		look_at(get_parent().get_parent().get_node("BattlePotionMaker").global_position)

