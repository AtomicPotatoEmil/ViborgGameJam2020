extends Node2D

func _ready():
	$AnimationPlayer.play("fade-in")
	$AudioStreamPlayer2D.play()
	pass


func _on_AnimationPlayer_animation_finished(anim_name):

	pass 
