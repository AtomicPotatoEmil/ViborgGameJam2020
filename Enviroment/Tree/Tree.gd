extends StaticBody2D



func _on_hitbox_area_entered(area):
	if area.is_in_group("claw"):
		$AnimatedSprite.play("fell")
	pass 
