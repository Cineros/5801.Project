#Made By Hunter Flati
extends Control

@export_file var map_path

var original_size := scale
var growth := Vector2(1.02, 1.02)

func button_grow(end: Vector2, duration: float):
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end, duration)

func _on_mouse_entered():
	button_grow(growth, .1)

func _on_mouse_exited():
	button_grow(original_size, .1)

func _on_pressed():
	if map_path == null:
		return
	
	get_tree().change_scene_to_file(map_path)
	
