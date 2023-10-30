#Made by Darius Wolfe on 10/18/2023
extends Node2D

@onready var _follow: PathFollow2D = get_parent()
var inc: float = 0
var speed = 100
var tick = 100

func _physics_process(delta):
	spawn_units()
	inc += delta*speed

func spawn_units():
	while tick > 0:
		var unit = load("res://enemy_units/!/!.tscn").instantiate()
		get_parent().add_child(unit)
		tick /= 2
		unit.global_position = get_node('Marker2D').global_position
		_follow.set_progress(inc)
