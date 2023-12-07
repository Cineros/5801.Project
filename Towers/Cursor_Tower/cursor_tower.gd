#Made on 10/16/2023 By Darius Wolfe
extends Node2D
var level = 1
var DAMAGE = 1 + level
var durability = level * 10
@export var SPEED: int = 2000 * level

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func destroy():
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()

func _on_cursor_hurtbox_body_entered(body):
	if "Enemy" in body.name:
		body.health -= DAMAGE
		durability - 1
		if durability == 0:
			destroy()
