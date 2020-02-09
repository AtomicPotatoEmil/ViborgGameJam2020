extends Node2D

onready var item = [$YSort/Areaspawn/Area2D, 
$YSort/Areaspawn/Area2D2,  $YSort/Areaspawn/Area2D3, 
$YSort/Areaspawn/Area2D4, $YSort/Areaspawn/Area2D5, $YSort/Areaspawn/Area2D6, 
$YSort/Areaspawn/Area2D7, $YSort/Areaspawn/Area2D8, $YSort/Areaspawn/Area2D9, $YSort/Areaspawn/Area2D10, 
$YSort/Areaspawn/Area2D11, $YSort/Areaspawn/Area2D12, $YSort/Areaspawn/Area2D13,
$YSort/Areaspawn/Area2D14, $YSort/Areaspawn/Area2D15, $YSort/Areaspawn/Area2D16,
$YSort/Areaspawn/Area2D17, $YSort/Areaspawn/Area2D18, $YSort/Areaspawn/Area2D19,
$YSort/Areaspawn/Area2D20, $YSort/Areaspawn/Area2D21, $YSort/Areaspawn/Area2D22, 
$YSort/Areaspawn/Area2D23, $YSort/Areaspawn/Area2D24, $YSort/Areaspawn/Area2D25, 
$YSort/Areaspawn/Area2D26, $YSort/Areaspawn/Area2D27, $YSort/Areaspawn/Area2D28,
$YSort/Areaspawn/Area2D29, $YSort/Areaspawn/Area2D30, $YSort/Areaspawn/Area2D31  
]

func _ready():
	$Timer.start()
	pass 

func span_loop():
#Lilys
	randomize()
	for i in range(1, 3):
		var itemload = preload("res://Items/lily/lily.tscn")
		var d = itemload.instance()
		add_child(d)
		d.position = item[randi()% 29+1].global_position
	$Timer.set_wait_time(range(1,15)[randi()%range(1,15).size()])
	
	#Pinkflower
	randomize()
	for i in range(1, 3):
		var itemload2 = preload("res://Items/pinkflower/pinkflower.tscn")
		var d = itemload2.instance()
		add_child(d)
		d.position = item[randi()% 29+1].global_position
	$Timer.set_wait_time(range(5,15)[randi()%range(5,15).size()])
	
	#Purpleflower
	randomize()
	for i in range(1, 3):
		var itemload3 = preload("res://Items/purpleflower/purpleflower.tscn")
		var d = itemload3.instance()
		add_child(d)
		d.position = item[randi()% 29+1].global_position
	$Timer.set_wait_time(range(5,15)[randi()%range(5,15).size()])
	
	#Mushroom
	randomize()
	for i in range(1, 3):
		var itemload4 = preload("res://Items/Mushroom/Mushroom.tscn")
		var d = itemload4.instance()
		add_child(d)
		d.position = item[randi()% 29+1].global_position
	$Timer.set_wait_time(range(5,15)[randi()%range(5,15).size()])
	pass 
	
	#Manapotion
	randomize()
	for i in range(1, 3):
		var itemload5 = preload("res://Items/Mana potion/ManaPotion.tscn")
		var d = itemload5.instance()
		add_child(d)
		d.position = item[randi()% 29+1].global_position
	$Timer.set_wait_time(range(5,15)[randi()%range(5,15).size()])



func _on_Timer_timeout():
	span_loop()
	pass # Replace with function body.


func _on_Player_player_dead():
	get_tree().change_scene("res://endings/bad/BadEnding.tscn")
	pass # Replace with function body.


func _on_Player_won():
	pass # Replace with function body.
