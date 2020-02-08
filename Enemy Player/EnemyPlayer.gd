extends KinematicBody2D

var VELOCITY = Vector2()
var SPEED = 350


enum {INIT, IDLE, RUN, ATTACK}
var state

var anim
var new_anim

func _ready():
	$StartTimer.start()
	change_state(INIT)
	pass

func get_input():
	VELOCITY = Vector2()
	
	if state in [IDLE, RUN]:
		if Input.get_action_strength("enemy_right"):
			VELOCITY.x += 1
			$AnimatedSprite.scale.x = -1
			change_state(RUN)
		if Input.get_action_strength("enemy_left"):
			VELOCITY.x -= 1
			$AnimatedSprite.scale.x = 1
			change_state(RUN)
		if Input.get_action_strength("enemy_down"):
			VELOCITY.y += 1
			change_state(RUN)
		if Input.get_action_strength("enemy_up"):
			VELOCITY.y -= 1
			change_state(RUN)
			
		if Input.is_action_just_pressed("enemy_melee_attack"):
			change_state(ATTACK)
		
	if state == RUN and VELOCITY.x == 0 and VELOCITY.y == 0:
		change_state(IDLE)

	
	VELOCITY = VELOCITY.normalized() * SPEED

	pass

func change_state(new_state):
	state = new_state
	
	match state:
		INIT:
			new_anim = "idle"
		IDLE:
			new_anim = "idle"
		RUN:
			new_anim = "run"
		ATTACK:
			new_anim = "attack"
	pass

func _physics_process(delta):
	get_input()
	
	if new_anim != anim:
		anim = new_anim
		$AnimationPlayer.play(new_anim)
	
	move_and_slide(VELOCITY)
	pass




func _on_AnimationPlayer_animation_finished(anim_name):
	change_state(IDLE)
	pass 


func _on_StartTimer_timeout():
	change_state(IDLE)
	pass 
