#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 200
@export var health = 1
var health_set = false

signal zeroDeath

func _process(delta):
	#if !health_set:
	#	health = get_parent().get_parent().unitHealth
	#	health_set = true
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()
		emit_signal("zeroDeath")


func destroy():
	queue_free()
	
