#Made on 10/17/23 by Darius Wolfe
extends CharacterBody2D

@export var health: int = 3
var _speed :int = 120

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + _speed*delta)
	if health <= 0:
		destroy()

func destroy():
	queue_free()
	

