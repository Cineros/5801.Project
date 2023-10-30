extends Node2D

var tik = 10
@onready var spawnTimer := $spawn_timer


func spawn_enemy():
	var enemy1 = load("res://enemy_units/!/!.tscn").instantiate()
	get_parent().add_child(enemy1)

func _process(delta):
	if spawnTimer.is_stopped():
		if tik > 0:
			tik -= 1
			spawn_enemy()
			spawnTimer.start()
		else:
			pass
	else:
		pass


