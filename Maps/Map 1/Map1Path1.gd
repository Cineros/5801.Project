extends Path2D

signal oneDeath
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_path_spawner_set_health(hp):
	get_child(0).get_child(0).health = hp


func _on_enemy_1_one_death(points):
	emit_signal("oneDeath", points)
