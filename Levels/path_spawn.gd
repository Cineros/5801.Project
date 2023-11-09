#Made by Darius Wolfe 10/31/2023
extends Node2D

signal enemy_changed(count)

var count = 0

@onready var path = preload("res://Levels/lvl1_path.tscn")

func _on_spawn_timer_timeout():
	var temp_path = path.instantiate()
	add_child(temp_path)
	count += 1
	emit_signal("enemy_changed", count)
	


func _on_pointer_tower_enemy_killed():
	count -= 1
	emit_signal("enemy_changed",count)
