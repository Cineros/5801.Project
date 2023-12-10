#Made on 10/16/2023 By Darius Wolfe
extends StaticBody2D

var level = 1
var attack_speed = 8000 * level

var bulletPath = preload("res://Towers/Pointer_Tower/bolt.tscn")
var damage = level + 1
var pathName
var targets = []
var target

@onready var fireDelay := $fire_delay

func _process(_delta):
	if is_instance_valid(target):
		self.look_at(target.global_position)
		

func _on_range_body_entered(body):
	if "!" in body.name or "Enemy" in body.name:
		look_at(body.global_position)
		shoot(body.global_position)


func _on_range_body_exited(_body):
	targets = get_node("range").get_overlapping_bodies()


func shoot(target):
	var bullet = bulletPath.instantiate()
	bullet.target = target
	bullet.position = $Pointer/point.global_position
	bullet.DAMAGE = damage
	
	get_node("tempContainer").add_child(bullet)
