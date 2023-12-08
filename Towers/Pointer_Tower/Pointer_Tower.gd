#Made on 10/16/2023 By Darius Wolfe
extends StaticBody2D

var level = 1
var attack_speed = 8000 * level

var bullet = preload("res://Towers/Pointer_Tower/bolt.tscn")
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
		var tempArray = []
		targets = get_node("range").get_overlapping_bodies()
		
		
		#print(targets)
		for i in targets:
			if "!" in i.name:
				tempArray.append(i)
		for i in targets:
			if "Enemy" in i.name:
				tempArray.append(i)
		
		var fTarget = null
		
		for i in tempArray:
			if fTarget == null:
				fTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > fTarget.get_progress():
					fTarget = i.get_node("../")
					
		target = fTarget
		pathName = target.get_parent().name
		
		var tempBullet = bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.DAMAGE = damage
		get_node("tempContainer").add_child(tempBullet)
		tempBullet.global_position = get_node("Pointer/point").global_position


func _on_range_body_exited(_body):
	targets = get_node("range").get_overlapping_bodies()
