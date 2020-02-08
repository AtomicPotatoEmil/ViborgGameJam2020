extends KinematicBody2D

var VELOCITY = Vector2()
var SPEED = 300

signal player_dead

enum  {INIT, IDLE, RUN, HURT, SHIELD, DEAD, ATTACK}
var state

var HP = 10

var anim
var new_anim

func _ready():
	change_state(IDLE)
	pass

func get_input():
	VELOCITY = Vector2()
	
	if state in [IDLE, RUN]:
		if Input.get_action_strength("player_right"):
			VELOCITY.x += 1
			change_state(RUN)
			$Sprite.scale.x = 1
		if Input.get_action_strength("player_left"):
			VELOCITY.x -= 1
			change_state(RUN)
			$Sprite.scale.x = -1
		if Input.get_action_strength("player_down"):
			VELOCITY.y += 1
			change_state(RUN)
		if Input.get_action_strength("player_up"):
			VELOCITY.y -= 1
			change_state(RUN)
		
		if state == RUN and VELOCITY.x == 0 and VELOCITY.y == 0:
			change_state(IDLE)
		
		if Input.is_action_just_pressed("player_attack"):
			change_state(ATTACK)
		
	if state == HURT:
		if Input.get_action_strength("player_right"):
			VELOCITY.x += 1
			$Sprite.scale.x = 1
		if Input.get_action_strength("player_left"):
			VELOCITY.x -= 1
			$Sprite.scale.x = -1
		if Input.get_action_strength("player_down"):
			VELOCITY.y += 1
		if Input.get_action_strength("player_up"):
			VELOCITY.y -= 1
	
	VELOCITY = VELOCITY.normalized() * SPEED
	pass

func _physics_process(delta):
	get_input()
	
	if state in [IDLE, ATTACK, RUN, SHIELD, HURT] and HP <= 0:
		change_state(DEAD)
		emit_signal("player_dead")
	
	if new_anim != anim:
		anim = new_anim
		$AnimationPlayer.play(new_anim)
	
	move_and_slide(VELOCITY)
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
		HURT:
			new_anim = "hurt"
		SHIELD:
			new_anim = "shield"
		DEAD:
			new_anim = "dead"
		ATTACK:
			new_anim = "attack"
	pass




func _on_AnimationPlayerAttack_animation_finished(attack):
	change_state(IDLE)
	pass 


func _on_AnimationPlayerHurt_animation_finished(hurt):
	change_state(IDLE)
	pass 


func _on_hitbox_area_entered(area):
	if area.is_in_group("claw"):
		HP -= 1
		change_state(HURT)
	if area.is_in_group("fireball"):
		HP -= 1
		change_state(HURT)
	pass 
