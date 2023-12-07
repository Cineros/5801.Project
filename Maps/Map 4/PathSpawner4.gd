#Made By Hunter Flati
extends Node2D

@onready var path = preload("res://Maps/Map 4/Map4Path.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
