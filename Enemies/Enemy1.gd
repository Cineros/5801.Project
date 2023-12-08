#Made By Hunter Flati
extends CharacterBody2D

@export var speed = 200
@export var health = 2
var health_total
var health_set = false

signal oneDeath

func destroy():
	queue_free()
	
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()
		emit_signal("oneDeath", health_total)

func _on_path_2d_set_hp(hp):
	if !health_set:
			health = hp
			health_total = health
			health_set = true
