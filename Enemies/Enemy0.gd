#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 200
@export var health = 1

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()


func destroy():
	queue_free()
	
