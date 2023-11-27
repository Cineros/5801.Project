#Made on 11/06/2023 By Petros Atsas
extends HBoxContainer


func _on_interface_health_changed(health):
	$counter/Label.text = str(health)
	$TextureProgressBar.value = health
