#Made By Hunter Flati & Darius Wolfe
extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Path.tscn")
@onready var OnePath = preload("res://Maps/Map 1/Map1Path1.tscn")
var counter = 0
var byte_count = 1
var round_count = 0
var enemy_tickets: int = 12
var temp_tik
var bits_needed = 2
var enemy_scene0 = preload("res://Enemies/Enemy0.tscn")
var enemy_scene1 = preload("res://Enemies/Enemy1.tscn")




signal set_health

func _on_timer_timeout():
	print(temp_tik)
	
	if temp_tik < 512:
		temp_tik = enemy_tickets/2
	else:
		temp_tik = enemy_tickets/16
		if bits_needed != 8:
			bits_needed = 8

	if temp_tik > 0 or counter < 8:
		if (temp_tik % 2 == 0 and temp_tik >= 128) or temp_tik >= 128 and counter == 0:
			spawnOne(128)
		elif counter == 0:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 64) or temp_tik >= 64 and counter == 1:
			spawnOne(64)
		elif counter == 1:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 32) or temp_tik >= 32 and counter == 2:
			spawnOne(32)
		elif counter == 2:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 16) or temp_tik >= 16 and counter == 3:
			spawnOne(16)
		elif counter == 3:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 8) or temp_tik >= 8 and counter == 4:
			spawnOne(8)
		elif counter == 4:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 4) or temp_tik >= 4 and counter == 5:
			spawnOne(4)
		elif counter == 5:
			spawnZero()
		if (temp_tik % 2 == 0 and temp_tik >= 2) or temp_tik >= 2 and counter == 6:
			spawnOne(2)
		elif counter == 6:
			spawnZero()
		if temp_tik == 1:
			spawnOne(1)
			if byte_count == bits_needed:
				get_node("Timer").stop()
		elif counter == 7:
			spawnZero()
			if byte_count == bits_needed:
				get_node("Timer").stop()
	counter += 1
	if counter > 7:
		byte_count += 1
		counter = 0

func spawnOne(health):
	var one_path = OnePath.instantiate()
	add_child(one_path)
	emit_signal("set_health", health)
	temp_tik -= health
	
func spawnZero():
	var tempPath = path.instantiate()
	add_child(tempPath)
	

func _on_interface_start_round():
	get_node("Timer").start()
	round_count += 1
	if round_count < 6:
		enemy_tickets * 2
	else:
		enemy_tickets * 1.2
	temp_tik = enemy_tickets
	print(enemy_tickets)
