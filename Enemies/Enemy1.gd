#Made By Hunter Flati & Darius Wolfe
extends CharacterBody2D

@export var speed = 200
@export var health = 2
var health_total
var first = true



signal oneDeath
signal requestHealth

func destroy():
	queue_free()
	
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if health <= 0:
		destroy()
		emit_signal("oneDeath", health_total)
		
func set_hp():
	emit_signal("requestHealth")


func _on_path_2d_send_health(pos):
	var health_set = false
	print("recieved HP")
	match pos:
		0:
			health = 128
			health_total = 128
			health_set = true
		1:
			health = 64
			health_total = 64
			health_set = true
		2:
			health = 32
			health_total = 32
			health_set = true
		3:
			health = 16
			health_total = 16
			health_set = true
		4:
			health = 8
			health_total = 8
			health_set = true
		5:
			health = 4
			health_total = 4
			health_set = true
		6:
			health = 2
			health_total = 2
			health_set = true
		7:
			health = 1
			health_total = 1
			health_set = true
		_:
			health = 0
			health_total = 0
			health_set = true
