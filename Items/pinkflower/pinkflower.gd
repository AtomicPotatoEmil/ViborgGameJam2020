extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.set_wait_time(range(1,10)[randi()%range(1,10).size()])
	$Timer.start()
	$AnimatedSprite.play()
	pass




func _on_pinkflower_body_entered(body):
	if body.is_in_group("player"):
		body.gainMana()
	else:
		queue_free()
	pass 



func _on_pinkflower_timeout():
	queue_free()
