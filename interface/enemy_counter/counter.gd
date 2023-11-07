#Made on 11/06/2023 By Petros Atsas
extends NinePatchRect


# update count on enemy spawn
func _on_interface_enemy_spawned(count):
	$Label.text = str(count) 


# update count on enemy death
func _on_interface_enemy_death(count):
	$Label.text = str(count)
