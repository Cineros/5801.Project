# Made by Petros Atsas
extends Control

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
