extends Area2D

func _ready():
	$AnimatedSprite.play()
	pass


func _on_Mushroom_body_entered(body):
	if body.is_in_group("player"):
		body.gainMana()
	else:
		queue_free()
	pass 
