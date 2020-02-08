extends Area2D



func _ready():
	randomize()
	$Timer.set_wait_time(range(1,10)[randi()%range(1,10).size()])
	$Timer.start()
	pass


func _on_Timer_timeout():
	queue_free()
	pass 




func _on_ManaPotion_body_entered(body):
	if body.is_in_group("player"):
		body.gainMana()
		queue_free()
	else:
		queue_free()
	pass
