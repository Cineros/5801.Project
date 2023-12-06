#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 200
@export var health = 2
var health_set = false

func destroy():
	queue_free()
	
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()

func _on_set_health(hp):
	if !health_set:
			health = hp
			health_set = true
