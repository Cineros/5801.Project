extends Path2D

signal oneDeath
signal requestHealth
signal sendHealth
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_path_spawner_set_health(hp):
	emit_signal("sendHealth", hp)
	print("sent HP to unit")


func _on_enemy_1_one_death(points):
	emit_signal("oneDeath", points)


func _on_enemy_1_request_health():
	emit_signal("requestHealth")
