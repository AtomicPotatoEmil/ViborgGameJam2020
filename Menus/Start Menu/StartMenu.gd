extends Control


func _ready():
	$AudioStreamPlayer.play()
	pass

func _on_Credits_pressed():
	get_tree().change_scene("res://Menus/Credits/Credits.tscn")
	pass 
