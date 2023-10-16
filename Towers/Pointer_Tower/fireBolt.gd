#Made on 10/16/2023 By Darius Wolfe
extends Node2D


@export var SPEED: int = 800

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func destroy():
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()
