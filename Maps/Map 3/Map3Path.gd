#Made by Darius Wolfe
extends Path2D

signal zeroDeath
#var unitHealth = 0

func _on_enemy_0_zero_death():
	emit_signal("zeroDeath")
