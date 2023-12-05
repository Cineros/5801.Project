#Made by Darius Wolfe on 12/5/23
extends Control

@onready var round_count = $"../round_counter"
@onready var start_round = $"../PathSpawner/Timer"
var counter = 0

func _on_ready_button_pressed():
	counter += 1
	round_count.text = str(counter)
	start_round.start()
	get_node("../start_button").visible = false
