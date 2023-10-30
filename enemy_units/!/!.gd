#Made on 10/17/23 by Darius Wolfe

extends Node2D

@export var health: int = 1
@onready var _follow :PathFollow2D = get_parent()
var _speed :float = 12

func _physics_process(delta):
	_follow.set_progress(_follow.get_progress() + _speed * delta)

func destroy():
	queue_free()
	

func _on_area_2d_area_entered(area):
	health -= 1
	if health == 0:
		destroy()
