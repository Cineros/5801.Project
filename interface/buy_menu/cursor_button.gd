# Made on 11/18/23 by Petros Atsas
extends Button

var price = 100

func _on_pressed():
	var scene = preload("res://interface/buy_menu/drag_towers/cursor_drag.tscn")
	var tower = scene.instantiate()
	add_child(tower)


func _on_area_2d_3_body_entered(_body):
	disabled = true


func _on_area_2d_3_body_exited(_body):
	disabled = false
