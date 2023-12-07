#Made By Hunter Flati
extends Control

const map_button = preload("res://Menus/Map1Button.tscn")

@export_dir var dir_path

@onready var grid = $MarginContainer/VBoxContainer/GridContainer

func ready():
	get_maps(dir_path)
	
func get_maps(path):
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			create_map_button('%s/%s' % [dir.get_current_dir(), file_name], file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print('Error')
		
func create_map_button(map_path: String, map_name: String):
	var button = map_button.instantiate()
	#button.text = map_name.trim_suffix('.tscn').replace('_', ' ')
	button.map_path = map_path
	grid.add_child(button)
