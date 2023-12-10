#Made by Darius Wolfe on 12/5/23
extends Control

@onready var round_count = get_node("../round_counter")
var counter = 0
signal ready_button_pressed
signal money(counter)

func _on_ready_button_pressed():
	counter += 1
	round_count.text = str(counter)
	emit_signal("money",counter)
	emit_signal("ready_button_pressed")
	get_node("../start_button").visible = false

func _on_interface_round_end():
	get_node("../start_button").visible = true
