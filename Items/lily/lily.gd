extends Area2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	pass


func _on_lily_body_entered(body):
	if body.is_in_group("player"):
		body.gainMana()
	else:
		queue_free()
	pass 
