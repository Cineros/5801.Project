#Made on 11/06/2023 By Petros Atsas
extends Control



# create enemy spawn signal to send to counter
signal enemy_changed(count)


# create health signal to send to health bar
signal health_changed(health)


func _on_spawning_node_enemy_changed(count):
	emit_signal("enemy_changed", count) 


func _on_my_computer_health_changed(health):
	emit_signal("health_changed", health)

