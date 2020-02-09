extends Area2D

var VELOCITY = Vector2()
var SPEED = 200

func _ready():
	$AnimatedSprite.play()
	$Timer.start()
	pass

func _physics_process(delta):
	position += VELOCITY * delta
	pass

func movement():
	randomize()
	VELOCITY = Vector2()
	
	VELOCITY = Vector2(range(-1,2)[randi()%range(-1,2).size()], range(-2,3)[randi()%range(-2,3).size()]) 

	
	VELOCITY = VELOCITY.normalized() * SPEED
	pass

func _on_Timer_timeout():
	movement()
	pass 


func _on_Firefly_area_entered(area):
	if area.is_in_group("edge"):
		queue_free()
	if area.is_in_group("player"):
		queue_free()
	pass 
