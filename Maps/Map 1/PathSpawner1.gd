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
var tempHP = 2
var enemy_scene0 = preload("res://Enemies/Enemy0.tscn")
var enemy_scene1 = preload("res://Enemies/Enemy1.tscn")

signal set_health
signal addScore
signal roundEnd


func _process(_delta):
	pass

func _on_timer_timeout():
	print(temp_tik)
	
	if temp_tik < 512:
		temp_tik = enemy_tickets/2
	else:
		temp_tik = enemy_tickets/16
		if bits_needed != 8:
			bits_needed = 8

	if temp_tik > 0 or counter < 8:
		match counter:
			0:
				if (temp_tik % 2 == 0 and temp_tik >= 128) or (temp_tik > 128 and temp_tik % 2 == 1):
					spawnOne(128)
					print("spawned 1 -128")
					tempHP = 128
				else:
					spawnZero()
			1:
				if (temp_tik % 2 == 0 and temp_tik >= 64) or (temp_tik > 64  and temp_tik % 2 == 1):
					spawnOne(64)
					print("spawned 1 -64")
					tempHP = 64
				else:
					spawnZero()
			2:
				if (temp_tik % 2 == 0 and temp_tik >= 32) or (temp_tik > 32  and temp_tik % 2 == 1):
					spawnOne(32)
					print("spawned 1 -32")
					tempHP = 32
				else:
					spawnZero()
			3:
				if (temp_tik % 2 == 0 and temp_tik >= 16) or (temp_tik > 16  and temp_tik % 2 == 1):
					spawnOne(16)
					print("spawned 1 -16")
					tempHP = 16
				else:
					spawnZero()
			4:
				if (temp_tik % 2 == 0 and temp_tik >= 8) or (temp_tik > 8  and temp_tik % 2 == 1):
					spawnOne(8)
					print("spawned 1 -8")
					tempHP = 8
				else:
					spawnZero()
			5:
				if (temp_tik % 2 == 0 and temp_tik >= 4) or (temp_tik > 4  and temp_tik % 2 == 1):
					spawnOne(4)
					print("spawned 1 -4")
					tempHP = 4
				else:
					spawnZero()
			6:
				if (temp_tik % 2 == 0 and temp_tik >= 2) or (temp_tik > 2  and temp_tik % 2 == 1):
					spawnOne(2)
					print("spawned 1 -2")
					tempHP = 2
				else:
					spawnZero()
			7:
				if temp_tik == 1:
					spawnOne(1)
					print("spawned 1 -1")
					if byte_count == bits_needed:
						get_node("Timer").stop()
						emit_signal("roundEnd")
						byte_count = 0
				elif counter == 7:
					spawnZero()
					if byte_count == bits_needed:
						get_node("Timer").stop()
						emit_signal("roundEnd")
						byte_count = 0
	counter += 1
	if counter > 7:
		byte_count += 1
		counter = 0

func spawnOne(health):
	var one_path = OnePath.instantiate()
	add_child(one_path)
	temp_tik -= health
	
func spawnZero():
	var tempPath = path.instantiate()
	add_child(tempPath)
	

func _on_interface_start_round():
	get_node("Timer").start()
	round_count += 1
	if round_count < 6 and round_count != 1:
		enemy_tickets *= 2
	else:
		enemy_tickets *= 1.2
	temp_tik = enemy_tickets
	print(enemy_tickets)


func _on_one_path_one_death(points):
	emit_signal("addScore", points)


func _on_zero_path_zero_death():
	emit_signal("addScore", 1)


func _on_one_path_request_health():
	emit_signal("set_health", tempHP)
	print("sent HP to spawner")
