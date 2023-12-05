#Made By Hunter Flati
extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Path.tscn")

func _on_timer_timeout():
	
	#Need to think of a way to make this work better not just spamming 0s. //Darius
	var tempPath = path.instantiate()
	add_child(tempPath)
