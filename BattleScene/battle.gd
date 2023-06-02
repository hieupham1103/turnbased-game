extends Node2D

var battler_reference = preload("res://Battler/battler.tscn")
var battle_queue = []
var curr_battler = []

func _ready():
	var player1 = battler_reference.instantiate()
	var player2 = battler_reference.instantiate()
	player1.init("player1",10,9,8,7,6,5,4,5,0)
	player2.init("player2",11,9,158,7,6,5,4,3,0)
	player1.name = player1.name_battler
	add_child(player1)
	player2.name = player2.name_battler
	add_child(player2)
	
	var enemy1 = battler_reference.instantiate()
	var enemy2 = battler_reference.instantiate()
	enemy1.init("enemy1",10,9,8,7,6,5,4,2,1)
	enemy2.init("enemy2",11,9,18,7,6,5,4,6,1)
	enemy1.name = enemy1.name_battler
	add_child(enemy1)
	enemy2.name = enemy2.name_battler
	add_child(enemy2)
	
	curr_battler.append(player1)
	curr_battler.append(player2)
	curr_battler.append(enemy1)
	curr_battler.append(enemy2)
	
	for battler in curr_battler:
		print(battler)
		var group_pos = $player
		if (battler.master == 1):
			group_pos = $enemy
		for id in group_pos.get_child_count():
			if (group_pos.get_child(id).has_battler == false):
				print(group_pos.get_child(id).name)
				battler.global_position = group_pos.get_child(id).global_position
				group_pos.get_child(id).has_battler = true
				break
	
	for i in range(curr_battler.size()):
		battle_queue.append(i)
	
	battle_queue.sort_custom(sort_by_speed)
	
	print(battle_queue)

func sort_by_speed(a, b):
	return curr_battler[a].speed > curr_battler[b].speed


func _process(delta):
	pass
