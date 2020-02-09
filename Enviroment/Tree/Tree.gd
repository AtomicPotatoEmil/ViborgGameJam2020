extends StaticBody2D

var cleaved = false

func _on_hitbox_area_entered(area):
	if area.is_in_group("claw"):
		$AnimatedSprite.play("fell")
		cleaved = true
	pass 

func _physics_process(delta):
	if cleaved == true:
		$CollisionShape2D.disabled = true
		$hitbox/CollisionShape2D.disabled = true
	pass
