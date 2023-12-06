#Made By Hunter Flati & Darius Wolfe
extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Path.tscn")
var round_count = 0
var enemy_tickets: int = 12
var temp_tik
var bits_needed = 2
var enemy_scene0 = preload("res://Enemies/Enemy0.tscn")
var enemy_scene1 = preload("res://Enemies/Enemy1.tscn")

func _on_timer_timeout():
	#Need to think of a way to make this work better not just spamming 0s. //Darius
	var tempPath = path.instantiate()
	var enemy0 = enemy_scene0.instantiate()
	var enemy1 = enemy_scene1.instantiate()
	
	add_child(tempPath)
	
	if temp_tik < 512:
		temp_tik = enemy_tickets/2
	else:
		temp_tik = enemy_tickets/16
		if bits_needed != 8:
			bits_needed = 8
			
	for temp_tik in bits_needed: #for loop to run (AS MANY TIMES AT bits_needed), making sure it spawns at least 16 numbers.
		if (temp_tik % 2 == 0 and temp_tik >= 256) or temp_tik >= 256:
			add_child(enemy1)
			temp_tik - 256
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 128) or temp_tik >= 128:
			add_child(enemy1)
			temp_tik - 128
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 64) or temp_tik >= 64:
			add_child(enemy1)
			temp_tik - 64
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 32) or temp_tik >= 32:
			add_child(enemy1)
			temp_tik - 32
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 16) or temp_tik >= 16:
			add_child(enemy1)
			temp_tik - 16
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass	
		if (temp_tik % 2 == 0 and temp_tik >= 8) or temp_tik >= 8:
			add_child(enemy1)
			temp_tik - 8
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 4) or temp_tik >= 4:
			add_child(enemy1)
			temp_tik - 4
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 0 and temp_tik >= 2) or temp_tik >= 2:
			add_child(enemy1)
			temp_tik - 2
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
		if (temp_tik % 2 == 1 and temp_tik >= 1) or temp_tik >= 1:
			add_child(enemy1)
			temp_tik - 1
			pass
		else:
			add_child(enemy0)
			#temp_tik - 0
			pass
	

func _on_interface_start_round():
	get_node("Timer").start()
	round_count += 1
	if round_count < 6:
		enemy_tickets * 2
	else:
		enemy_tickets * 1.2
	temp_tik = enemy_tickets
	print(enemy_tickets)
