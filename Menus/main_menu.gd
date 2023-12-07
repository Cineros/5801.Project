#Made on 10/16/2023 By Darius Wolfe
extends Control

@onready var animTimer := $anim_timer
var mSelect = load("res://Menus/MapSelectScreen.tscn")
var oSelect = load("res://Menus/OptionScreen.tscn")
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/start_button.grab_click_focus()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter < 64:
		get_node("BitsByte").scale += Vector2(delta, delta)/32
		counter += 1
	else:
		get_node("BitsByte").scale -= Vector2(delta, delta)/32
		counter += 1
		if counter == 128:
			counter = 0
		
		

func _on_start_button_pressed():
	var load_map_select = mSelect.instantiate()
	get_parent().add_child(load_map_select)
	get_tree().change_scene_to_file("res://Menus/MapSelectScreen.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
	

func _on_options_button_pressed():
	var load_options_select = oSelect.instantiate()
	get_parent().add_child(load_options_select)
	get_tree().change_scene_to_file("res://Menus/OptionScreen.tscn")

