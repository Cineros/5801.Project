#Made on 10/17/23 by Darius Wolfe
extends CharacterBody2D

@export var health: int = 2
var _speed :int = 200

signal enemy_destroyed()

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + _speed*delta)
	if health <= 0:
		destroy()
		emit_signal("enemy_destroyed")

func destroy():
	queue_free()
	

