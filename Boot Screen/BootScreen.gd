extends Node2D

func _ready():
	$AnimationPlayer.play("fade-in")
	$AudioStreamPlayer2D.play()
	pass

