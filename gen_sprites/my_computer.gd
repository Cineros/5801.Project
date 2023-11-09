# Made on 11/08/23 by Petros Atsas
extends Sprite2D


signal health_changed(health)

@onready var health = 100;

func _on_area_2d_area_entered(area):
	health -= 2
	emit_signal("health_changed", health) 
