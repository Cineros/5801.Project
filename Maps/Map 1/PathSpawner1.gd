#Made By Hunter Flati & Darius Wolfe
extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Path.tscn")
@onready var OnePath = preload("res://Maps/Map 1/Map1Path1.tscn")
var counter = 0
var byte_count = 0
var round_count = 0
var enemy_tickets: int = 12
var temp_tik
var bits_needed = 2
var enemy_scene0 = preload("res://Enemies/Enemy0.tscn")
var enemy_scene1 = preload("res://Enemies/Enemy1.tscn")


signal set_health

func _on_timer_timeout():
	print(temp_tik)
	var tempPath = path.instantiate()
	#Need to think of a way to make this work better not just spamming 0s. //Darius
	#var enemy0 = enemy_scene0.instantiate()
	#var enemy1 = enemy_scene1.instantiate()
	if temp_tik > 0 or counter < 8:
		if (temp_tik % 2 == 0 and temp_tik >= 256) or temp_tik >= 256:
			emit_signal("set_health", 256)
			temp_tik -= 256
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 128) or temp_tik >= 128:
			emit_signal("set_health", 128)
			temp_tik -= 128
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 64) or temp_tik >= 64:
			emit_signal("set_health", 64)
			temp_tik -= 64
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 32) or temp_tik >= 32:
			emit_signal("set_health", 32)
			temp_tik -= 32
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 16) or temp_tik >= 16:
			emit_signal("set_health", 16)
			temp_tik -= 16
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 8) or temp_tik >= 8:
			emit_signal("set_health", 8)
			temp_tik -= 8
			print(temp_tik)
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 4) or temp_tik >= 4:
			emit_signal("set_health", 4)
			temp_tik -= 4
			print(temp_tik)
		else:
			add_child(tempPath)
			#temp_tik - 0
		if (temp_tik % 2 == 0 and temp_tik >= 2) or temp_tik >= 2:
			emit_signal("set_health", 2)
			temp_tik -= 2
		else:
			add_child(tempPath)
			#temp_tik - 0
		if temp_tik == 1:
			emit_signal("set_health", 1)
			temp_tik -= 1
			if byte_count == 2:
				get_node("Timer").stop()
		else:
			add_child(tempPath)
			if byte_count == 2:
				get_node("Timer").stop()
	if temp_tik < 512:
		temp_tik = enemy_tickets/2
	else:
		temp_tik = enemy_tickets/16
		if bits_needed != 8:
			bits_needed = 8
	counter += 1
	if counter > 7:
		byte_count += 1
		counter = 0
	#for i in bits_needed: #for loop to run (AS MANY TIMES AT bits_needed), making sure it spawns at least 16 numbers.
		#while temp_tik > 0:
			#pass
	

func _on_interface_start_round():
	get_node("Timer").start()
	round_count += 1
	if round_count < 6:
		enemy_tickets * 2
	else:
		enemy_tickets * 1.2
	temp_tik = enemy_tickets
	print(enemy_tickets)


func _on_set_health(EHP):
	var one_path = OnePath.instantiate()
	add_child(one_path)
	
