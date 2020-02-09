extends Control


func _ready():
	$AudioStreamPlayer.play()
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("player_attack") or Input.is_action_just_pressed("enemy_melee_attack"):
		return
	
	if Input.is_action_just_pressed("fireball_attack") or Input.is_action_just_pressed("player_attack"):
		get_tree().change_scene("res://Menus/Credits/Credits.tscn")
	pass

func _on_Credits_pressed():
	get_tree().change_scene("res://Menus/Credits/Credits.tscn")
	pass 
