#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 400
var health = 0

if (health


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
