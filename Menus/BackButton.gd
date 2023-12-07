#Made By Hunter Flati
extends Button

@export_file var main_menu

func _on_pressed():
	if main_menu == null:
		return
	
	get_tree().change_scene_to_file(main_menu)
