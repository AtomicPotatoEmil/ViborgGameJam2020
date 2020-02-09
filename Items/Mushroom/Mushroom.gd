extends Area2D

func _ready():
	randomize()
	$Timer.set_wait_time(range(1,10)[randi()%range(1,10).size()])
	$Timer.start()
	$AnimatedSprite.play()
	pass


func _on_timeout_shroom():
	queue_free()


func _on_Mushroom_area_entered(area):
	if area.is_in_group("Item"):
		queue_free()
	if area.is_in_group("player"):
		queue_free()
		pass # Replace with function body.
