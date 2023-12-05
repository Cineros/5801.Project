#Made By Hunter Flati
extends Node2D

@onready var path = preload("res://Maps/Map 6/Map6Path.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
