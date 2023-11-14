#Made on 11/06/2023 By Petros Atsas
extends NinePatchRect


# update count on enemy spawn and death
func _on_interface_enemy_changed(count):
	$Label.text = str(count)
