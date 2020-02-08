extends KinematicBody2D

var VELOCITY = Vector2()
var SPEED = 350

var HP = 3

signal enemy_dead

var can_shoot = true

enum {INIT, IDLE, RUN, ATTACK, FIREBALL, HURT, DEAD}
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
		if Input.is_action_just_pressed("fireball_attack"):
			var BALL = preload("res://Enemy Player/Fireball/Fireball.tscn")
			var b = BALL.instance()
			b.global_position = $AnimatedSprite/FireballPos.global_position
			if $AnimatedSprite.scale.x == 1:
				b.change_direction(-1)
			else:
				b.change_direction(1)
			get_parent().add_child(b)
			change_state(FIREBALL)
		
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
		FIREBALL:
			new_anim = "fireball"
		HURT:
			new_anim = "hurt"
		DEAD:
			new_anim = "dead"
	pass

func _physics_process(delta):
	get_input()
	
	if new_anim != anim:
		anim = new_anim
		$AnimationPlayer.play(new_anim)
	
	move_and_slide(VELOCITY)
	pass




func _on_AnimationPlayer_animation_finished(attack):
	change_state(IDLE)
	pass

func _on_StartTimer_timeout():
	change_state(IDLE)
	pass 


func _on_AnimationPlayerFireball_animation_finished(fireball):
	change_state(IDLE)
	pass 

func hurt():
	if state in [IDLE, RUN, ATTACK, FIREBALL]:
		change_state(HURT)
		HP -= 1
	pass


func _on_AnimationPlayerHurt_animation_finished(hurt):
	change_state(IDLE)
	pass 


func _on_AnimationPlayerDead_animation_finished(dead):
	emit_signal("enemy_dead")
	pass 
