# Made on 11/18/23 by Petros Atsas
extends Button

var price = 30
signal tower_bought(price)

func _on_pressed():
	var scene = preload("res://interface/buy_menu/drag_towers/cursor_drag.tscn")
	var tower = scene.instantiate()
	add_child(tower)
	emit_signal("tower_bought", price)


