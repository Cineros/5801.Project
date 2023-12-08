#Made on 10/16/2023 By Darius Wolfe
extends CharacterBody2D

var DAMAGE = 1
var SPEED = 800
var target
var pathName = ""

func _physics_process(delta):
	var spawnNode = get_tree().get_root().get_node("PathSpawner")
	for i in spawnNode.get_child_count():
		if spawnNode.get_child(i).name == pathName:
			target = spawnNode.get_child(i).get_child(0).get_child(0).global_position
	
	velocity = global_position.direction_to(target) * SPEED
	
	look_at(target)
	
	move_and_slide()

func destroy():
	queue_free()
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()



func _on_hurtbox_bolt_body_entered(body):
	if "Enemy" in body.name:
		body.health -= DAMAGE
		destroy()
