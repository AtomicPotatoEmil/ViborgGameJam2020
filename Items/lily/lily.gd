extends Area2D




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.set_wait_time(range(1,10)[randi()%range(1,10).size()])
	$Timer.start()
	$AnimatedSprite.play()
	pass


func _on_lily_body_entered(body):
	if body.is_in_group("player"):
		body.gainMana()
	pass 



func _on_lily_timeout():
	queue_free()
	


func _on_lily_area_entered(area):
	if area.is_in_group("Item"):
		queue_free()
	
	pass # Replace with function body.
