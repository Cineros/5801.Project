#Made on 10/16/2023 By Darius Wolfe
extends Node2D

@export var DAMAGE: int = 1
@export var SPEED: int = 800

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func destroy():
	queue_free()
	

func _on_hitbox_bolt_area_entered(area):
	destroy()
