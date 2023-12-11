#Made on 11/06/2023 By Petros Atsas
extends Control

signal start_round
signal damage
signal roundEnd
signal addScore

# create enemy spawn signal to send to counter
signal enemy_spawned(count)

# create enemy death signal to send to counter
signal enemy_death(count)

# create health signal to send to health bar
signal health_changed(health)


func _on_start_button_ready_button_pressed():
	emit_signal("start_round")


func _on_my_computer_hp_damage(hp):
	emit_signal("damage", hp)


func _on_path_spawner_round_end():
	emit_signal("roundEnd")




func _on_path_spawner_add_score(score):
	emit_signal("addScore", score)
