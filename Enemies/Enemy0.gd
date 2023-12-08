#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 200
@export var health = 1

signal zeroDeath

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()
		emit_signal("zeroDeath")


func destroy():
	queue_free()
	
