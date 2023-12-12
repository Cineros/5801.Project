#Made on 11/06/2023 By Petros Atsas
extends HBoxContainer

func _on_interface_damage(hp):
	if hp < 1:
		get_tree().change_scene_to_file("res://Menus/Game_over_screen/game_over.tscn")
		pass
	$counter/Label.text = str(hp)
	$TextureProgressBar.value = hp


func _on_interface_health_changed(health):
	pass # Replace with function body.
