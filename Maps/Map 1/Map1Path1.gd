extends Path2D

signal set_hp
signal oneDeath
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_path_spawner_set_health(hp):
	emit_signal("set_hp", hp)


func _on_enemy_1_one_death(points):
	emit_signal("oneDeath", points)
