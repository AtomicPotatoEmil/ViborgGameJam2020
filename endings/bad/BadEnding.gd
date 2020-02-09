extends Control

func _ready():
	$AnimationPlayer.play("button")
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("X-A"):
		get_tree().change_scene("res://Menus/Start Menu/StartMenu.tscn")
	pass
