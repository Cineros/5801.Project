#Made By Hunter Flati & Darius Wolfe
extends CharacterBody2D

@export var speed = 200
@export var health = 3
var health_total
var hp_set = false


signal oneDeath
signal requestHealth

func destroy():
	queue_free()
	
func _process(delta):
	if health == 3 and !hp_set:
		health = get_parent().get_parent().unitHealth
		health_total = health
		hp_set = true
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()
		emit_signal("oneDeath", health_total)
		
