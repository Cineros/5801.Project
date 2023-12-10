#Made by Darius Wolfe
extends Path2D

signal oneDeath
var unitHealth = 0

func _on_enemy_1_one_death(points):
	emit_signal("oneDeath", points)
