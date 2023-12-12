#Made By Hunter Flati
extends Control

const map_button = preload("res://Menus/Map1Button.tscn")

@export_dir var dir_path

@onready var grid = $MarginContainer/VBoxContainer/GridContainer
