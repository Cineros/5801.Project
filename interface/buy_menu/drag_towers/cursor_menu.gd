# Made on 11/29/23 by Petros Atsas
extends PopupMenu


signal tower_placed(placed)
signal tower_sold()

var placed = false


func _on_id_pressed(id):
	if id == 0:
		placed = not placed
		emit_signal("tower_placed",placed)
		set_item_checked(0,placed)
	if id == 1:
		emit_signal("tower_sold")


func _on_cursor_drag_pop():
	popup()
