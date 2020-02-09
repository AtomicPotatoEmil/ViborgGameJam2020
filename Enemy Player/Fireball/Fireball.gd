extends Area2D

var VELOCITY = Vector2()
var SPEED = 100

var DIRECTION = 1

func _ready():
	$AnimatedSprite.play()

func _physics_process(delta):
	VELOCITY.x += SPEED * delta * DIRECTION
	translate(VELOCITY)
	pass

func change_direction(dir):
	DIRECTION = dir
	pass


func _on_Fireball_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
	pass 
