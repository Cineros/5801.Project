#Made by Darius Wolfe 10/31/2023
extends Node2D

@onready var path = preload("res://Levels/lvl1_path.tscn")

func _on_spawn_timer_timeout():
	var temp_path = path.instantiate()
	add_child(temp_path)
