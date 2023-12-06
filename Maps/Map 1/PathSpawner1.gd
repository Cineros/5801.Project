#Made By Hunter Flati & Darius Wolfe
extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Path.tscn")
var round_count = 0
var enemy_tickets: int = 16
var temp_tik
var bits_needed = 2

func _on_timer_timeout():
	#Need to think of a way to make this work better not just spamming 0s. //Darius
	var tempPath = path.instantiate()
	add_child(tempPath)
	if temp_tik < 512:
		temp_tik/2
	else:
		temp_tik/16
		if bits_needed != 8:
			bits_needed = 8
	#for loop to run (AS MANY TIMES AT bits_needed), making sure it spawns at least 16 numbers.
	if temp_tik % 2 == 0 and temp_tik >= 256:
		#spawn a 1 with health 255
		#temp_tik - 256
		pass
	else:
		#spawn a 0 with 1 hp
		#temp_tik - 0
		pass
	if temp_tik % 2 == 0 and temp_tik >= 128:
		#spawn a 1 with health 127
		#temp_tik - 128
		pass
	else:
		#spawn a 0 with 1 hp
		pass
	#So on and so forth
	

func _on_interface_start_round():
	get_node("Timer").start()
	round_count += 1
	if round_count < 6:
		enemy_tickets * 2
	else:
		enemy_tickets * 1.2
	temp_tik = enemy_tickets
	print(enemy_tickets)
