extends Node

onready var cam1 = $HBoxContainer/PlayerViewPort/Viewport/Camera2D
onready var cam2 = $HBoxContainer/EnemyViewPort/Viewport2/Camera2D

onready var player_viewport = $HBoxContainer/PlayerViewPort/Viewport
onready var enemy_viewport = $HBoxContainer/EnemyViewPort/Viewport2

onready var world = $HBoxContainer/PlayerViewPort/Viewport/Node2D

func _ready():
	$AudioStreamPlayer.play()
	enemy_viewport.world_2d = player_viewport.world_2d
	pass

func _physics_process(delta):
	cam1.global_position = world.get_node("YSort/Player").global_position
	cam2.global_position = world.get_node("YSort/EnemyPlayer").global_position
	pass
