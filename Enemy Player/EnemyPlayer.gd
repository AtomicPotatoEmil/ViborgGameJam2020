extends KinematicBody2D

var VELOCITY = Vector2()
var SPEED = 200

enum {IDLE, RUN, ATTACK}
var state

var anim
var new_anim

func change_state(new_state):
	state = new_state
	
	match state:
		IDLE:
			new_anim = "idle"
		RUN:
			new_anim = "run"
		ATTACK:
			new_anim = "attack"
	pass

func _physics_process(delta):
	
	if anim != new_anim:
		new_anim = anim
		$AnimationPlayer.play(anim)
	pass
