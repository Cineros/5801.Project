#Made on 10/16/2023 By Darius Wolfe
extends Node2D

var level = 1
var speed = 1 + level
var DAMAGE = 1 + level
var targets = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation -= delta/2
	pass
	
func murderTime(delta):
	rotation -= delta * speed
	if(speed < 50):
		speed += 2*(speed * delta)
	else:
		if len(targets) == 0:
			speed = 1


func _on_enemy_detection_range_area_entered(_area):
	murderTime(get_process_delta_time())


func _on_enemy_detection_range_body_entered(body):
	if "!" in body.name or "Enemy 0" in body.name:
		var tempArray = []
		targets = get_node("enemy_detection_range").get_overlapping_bodies()
		
		
		#print(targets)
		for i in targets:
			if "!" in i.name:
				tempArray.append(i)
		for i in targets:
			if "Enemy" in i.name:
				tempArray.append(i)
			
		#print(tempArray)
		if len(tempArray) != 0:
			murderTime(get_process_delta_time())


func _on_enemy_detection_range_body_exited(body):
	targets = get_node("enemy_detection_range").get_overlapping_bodies()


func _on_range_body_entered(body):
	pass


func _on_damage_range_body_entered(body):
		if "!" in body.name:
			body.health -= DAMAGE
