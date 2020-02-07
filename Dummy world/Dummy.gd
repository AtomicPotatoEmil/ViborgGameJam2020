extends KinematicBody2D

var VELOCITY = Vector2()
var SPEED = 200


func _physics_process(delta):
	get_input()
	move_and_slide(VELOCITY)
	pass

func get_input():
	VELOCITY = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		VELOCITY.x += 1
	if Input.is_action_pressed("ui_left"):
		VELOCITY.x -= 1
	if Input.is_action_pressed("ui_down"):
		VELOCITY.y += 1
	if Input.is_action_pressed("ui_up"):
		VELOCITY.y -= 1
	
	VELOCITY = VELOCITY.normalized() * SPEED
	pass
