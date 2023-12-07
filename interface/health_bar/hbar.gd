#Made on 11/06/2023 By Petros Atsas
extends HBoxContainer

func _on_interface_damage(hp):
	$counter/Label.text = str(hp)
	$TextureProgressBar.value = hp
