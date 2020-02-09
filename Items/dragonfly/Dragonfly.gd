extends Area2D


func _ready():
	$Timer.start()
	$AnimatedSprite.play("fly")
	pass



func _on_Timer_timeout():
	position.x += range(-300, 300)[randi()%range(-300, 300).size()]
	position.y += range(-300, 300)[randi()%range(-300, 300).size()]
	pass 



func _on_Dragonfly_area_entered(area):
	if area.is_in_group("edge"):
		queue_free()
	if area.is_in_group("player"):
		queue_free()
	pass 




