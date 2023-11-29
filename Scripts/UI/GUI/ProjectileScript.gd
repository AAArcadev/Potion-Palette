extends Area2D

var speed = 70
export var damageNo=1
func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_Projectile_body_entered(body):
	if 'BattlePotionMaker' in body.name:
		body.Damaged(damageNo)
		speed=0
		$CollisionShape2D.disabled=true
		$AnimatedSprite.play("Poof")
		MusicHandler.get_node("ProjectileHitSound").play()
		$CPUParticles2D.emitting=false
		if 'BattleCollisionSides' in body.name:
			speed=0
			$CollisionShape2D.disabled=true
			$AnimatedSprite.play("Poof")
		
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation=="Poof":
		queue_free()
