#Made on 10/16/2023 By Darius Wolfe
extends Node2D

var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation -= delta/2
	murderTime(delta)
	pass
	
func murderTime(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		rotation -= delta * speed
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if(speed < 50):
				speed += 2*(speed * delta)
	else:
		speed = 1
